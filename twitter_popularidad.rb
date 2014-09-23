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
	@number = 10 if @number > 10
	if client.user? @name
# 		seguidores = client.friend_ids("jonay_bta").attrs[:ids].take(10)
# 		seguidores = client.friends(@name,{})
# 		@todo_tweet =(@todo_tweet != '') ? seguidores.map{ |i| i.name} : ''
# 		@todo_tweet = ultimos_t.map { |i| i.name }
		
		
# 		ultimos_t = client.user_timeline(@name,{:count=>@number.to_i})
# 		@todo_tweet =(@todo_tweet != '') ? ultimos_t.map{ |i| i.text} : ''
		
# 		ultimos_t = client.friends(@name, {})
		ultimos_t = client.friends(@name, {}).take(@number)
# 		puts 'aaaaa'
# 		puts ultimos_t
		@todo_tweet = ultimos_t.map { |i| i.name }
# 		puts 'bbbbb'
# 		puts @todo_tweet
	end
	erb :twitter
end