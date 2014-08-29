require './lib/player'

class Game

	attr_accessor :players

	def initialize
		@players = []
		@player_1_name = ""
		@player_2_name = ""
	end

	def add!(player)
		@players << player
	end

	def get_name_player_1
		puts "Please enter name of Player 1:"
		@player_1_name = gets.chomp
		if @player_1_name == ""
			@player_1_name = "Player 1"
		end 
		@player_1_name
	end

	def get_name_player_2
		puts "Please enter name of Player 2:"
		@player_2_name = gets.chomp
		if @player_2_name == ""
			@player_2_name = "Player 2"
		end 
		@player_2_name
	end

	def player_1_deploy(ship)
		deploy!(ship)
	end

	def starting?
		@players.count == 2
	end

	def current_player
		@players.first
	end

	def other_player
		@players.last
	end

	def change_turns
		@players.rotate!
	end

	def own_board
		current_player.board
	end

	def opponents_board
		other_player.board
	end
	
end