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
	
	