require './lib/player'

class Game

	attr_accessor :players

	def initialize
		@players = []
	end

	def add!(player)
		@players << player
	end

	def starting?
		@players.length == 2
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