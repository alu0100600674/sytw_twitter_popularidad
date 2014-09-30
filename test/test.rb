ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative '../twitter_popularidad.rb'
 
include Rack::Test::Methods
 
def app
  Sinatra::Application
end

describe "Contenido de la web" do
	
	it "Carga de la web" do
		get '/'
		assert last_response.ok?
	end
	
	it "Titulo de la web" do
		get '/'
		assert last_response.head.include?("Amigos más populares de un usuario")
	end
	
	it "Titulo de la web mostrado" do
		get '/'
		assert last_response.body.include?("Amigos más populares de un usuario")
	end
	
end