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
		assert last_response.body.include?("<title>Amigos más populares de un usuario</title>")
	end
	
	it "Titulo de la web mostrado" do
		get '/'
		assert last_response.body.include?("Amigos más populares de un usuario")
	end
	
	it "Campo para la inserción de un usuario" do
		get '/'
		assert last_response.body.include?("Introduzca su nombre en Twitter")
	end
	
	it "Campo para reducir el número de amigos a buscar" do
		get '/'
		assert last_response.body.include?("¿Cuántos amigos quiere ver?")
	end
	
end


describe "Usuarios en Twitter" do
	
	before :all do
		@client = my_twitter_client()
		@user1 = "jonay_bta"
		@user2 = "bmbuenavista"
		@user3 = "aaaa1aa1aaaaaaabb2bbbb2bbbbbc3ccccccc3ccc"
	end
	
	it "Usuario que debe existir" do
		assert @client.user? @user1
		assert @client.user? @user2
	end
	
	it "Usuario que no debe existir" do
		refute @client.user? @user3
	end
	
end