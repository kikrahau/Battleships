class Player

	attr_accessor :board
	# attr_accessor :fleet

	def initialize(board)
		@board = board
		# @fleet = fleet #should be filled at initialization of the Player-class by the Game
	end

	def fire_missile_at(opponents_board, at_coordinate) # opponent _board needs to be a board class, at_coordinate needs to be string like "A1"
		opponents_board.grid[at_coordinate].hit!
	end

	def place(ship_type, at_coordinate, direction) #ship_type needs to be ship class, at_coordinate needs to be string like "A1", direction needs to be "horizontal" or "vertical"
		if direction == "horizontal"
			coordinates = ((at_coordinate.chars.last.to_i)..ship_type.badass_rating).map{|coord| at_coordinate.chars.first << coord.to_s}
		elsif "vertical"
			coordinates = ((at_coordinate.chars.first.ord)..(at_coordinate.chars.first.ord + ship_type.badass_rating)).map{|coord| coord.chr << at_coordinate.chars.last}
		end
		coordinates.each do |coordinate|
			@board.grid[coordinate].deploy!(ship_type)
		end
	end
end