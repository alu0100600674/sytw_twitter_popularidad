# -*- coding: utf-8 -*-
require 'twitter'
require 'sinatra'

require './configure'

get '/' do
	@seguidores = []
	@nombre = ''
	@numero = 0
	erb :twitter
end


post '/' do
	@seguidores = []
	client = my_twitter_client()
	@nombre = params[:firstname] || ''
	@numero = params[:n].to_i
	@numero = 1 if @numero <= 0
	if client.user? @nombre
		seguidores = client.friend_ids("crguezl").attrs[:ids].take(10)
		
	end
	erb :twitter
end