# -*- coding: utf-8 -*-
require 'twitter'
require 'sinatra'

require './configure'

get '/' do
	@todo_tweet = []
	@name = ''
	@number = 0
	erb :twitter
end


post '/' do
	@todo_tweet = []
	client = my_twitter_client()
	@name = params[:firstname] || ''
	@number = params[:n].to_i
	@number = 1 if @number <= 0
# 	@number = 10 if @number > 10
	if client.user? @name
		
# 		ultimos_t = client.friends(@name, {})
		ultimos_t = client.friends(@name, {}).take(@number)
		@todo_tweet = ultimos_t.map { |i| i.name }
		
		amigos = Hash.new
		for i in ultimos_t
			amigos[i.name] = i.followers_count
		end
		
		@todo_tweet = amigos.sort_by{|k,v| v}.reverse
		
	end
	erb :twitter
end











