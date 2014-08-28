# require './lib/ship'

class Player

# attr_accessor :fire_missile

	def initialize(board: :just_a_board, fleet: :ship_here)
		@board = board
		@fleet = fleet
	end

	attr_reader :cell

	def fire_missile_at(opponent_board, at_coordinate)
		opponent_board.cell[at_coordinate].hit!
	end

	def ships
		@fleet
	end

	def has_ships?
		true
	end

	def place(ship_type, origin, direction)
		if direction == horizontal
			coordinates = ((origin.chars.last.to_i)..ship_type.badass_rating).map{|coord| origin.chars.first << coord.to_s}
			coordinates.each do |coordinate|
			@board.grid[coordinate].place(ship_type)
		end
		else
		end	
	end

end

