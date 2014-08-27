class Player

# attr_accessor :fire_missile

	# def intitialize
	# 	@fire_missile
	# end

	def fire_missile_at(cell)
		cell.hit!
	end

	def place_ship(cell)
		cell.occupation
	end

end