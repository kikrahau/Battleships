require './lib/ship'

class Player

# attr_accessor :fire_missile

	def intitialize(board: :just_a_board)
		@board = board
	end

	attr_reader :grid

<<<<<<< HEAD
	def fire_missile_at(opponent_board, at_coordinate)
		opponent_board.grid[at_coordinate].hit!
=======
	def fire_missile_at(cell)
		cell.hit!
>>>>>>> 58b16852812855185ea2b659401996dea9f469c5
	end

	def place_ship(ship)
		cell.ship!(ship)
	end


	def ships
		[]
	end

end