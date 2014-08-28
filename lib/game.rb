class Game

	attr_accessor :players

	def initialize
		@players = []
	end


	def add!(player)
		@players << player
	end

	def starting?
		@players.length == 0
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
end