require 'sinatra/base'

class Battleships < Sinatra::Base

set :views, Proc.new{File.join(root,'..','views')}

  get '/' do
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
    erb :game_confirmation
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
