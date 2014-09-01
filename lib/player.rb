class Player

	attr_accessor :board
	# attr_accessor :fleet

	def initialize(board = nil)
		@board = board
		# @fleet = fleet #should be filled at initialization of the Player-class by the Game
	end

	def fire_missile_at(at_coordinate) # opponent _board needs to be a board class, at_coordinate needs to be string like "A1"
		board.grid[at_coordinate].hit!
	end

	def place(ship_type, at_coordinate, direction = "horizontal") #ship_type needs to be ship class, at_coordinate needs to be string like "A1", direction needs to be "horizontal" or "vertical"
  	coordinates_for(at_coordinate, ship_type.badass_rating, direction).each do |x|
  		board.grid[x].deploy!(ship_type)
		end
  end

	def coordinates_for(starting_point, size, orientation)
		x,y, coords = starting_point.split("") << []
		orientation == "horizontal" ? size.times{ |i|coords << "#{x.upcase}#{i + 1}"} : size.times{coords << "#{x.upcase}#{y}"; x = x.next}
		coords
	end

end