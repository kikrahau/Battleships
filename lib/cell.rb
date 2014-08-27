require 'water'

class Cell

  def initialize
  	@cell_content = nil
    # @hit = false
  end

  def cell_content?
  	@cell_content 
  end

	def ship!(ship)
    	@cell_content = ship
	end

	def has_ship?
		return true unless @cell_content == nil
	end

	# def has_hit?
	# 	@hit
	# end

	# def hit!
	# 	@hit = true
	# end

 #  def place_ship(ship)
 #    ship
 #  end
end
