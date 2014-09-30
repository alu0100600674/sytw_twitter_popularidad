ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative '../twitter_popularidad.rb'
 
include Rack::Test::Methods
 
def app
  Sinatra::Application
end

describe "Contenido de la web" do
	
	
end