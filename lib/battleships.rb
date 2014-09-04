require 'sinatra/base'
require './lib/game'

class Battleships < Sinatra::Base


	enable :sessions

	set :views, Proc.new{File.join(root,'..','views')}

	GAME = Game.new

  get '/' do
  	p GAME
		erb :index
  end

  get '/new_game' do
  	if params[:errors]
  		@errors = params[:errors]
  	end
		erb :new_game
  end

  post '/new_game' do
	 	@name = params[:player]
	 	if @name == "" 
	 		redirect '/new_game?errors=Please%20re-enter%20your%20name'
	 	end
	 	player = Player.new(@name)
	 	# GAME.add(player)
	 	# session['me']= player.object_id
    erb :game_confirmation
  end

  get '/session_full' do 
  	erb :session_full
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
