require './lib/ship'

class Cell

attr_accessor :cell_content, :hit

  def initialize
  	@cell_content = nil
    @hit = false
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

	def has_hit?
		@hit
	end

	def hit!
		@hit = true
	end

	def hit(ship)
		ship.hit_counter if has_ship? 
	end
`


end
