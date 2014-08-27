class Cell

  def initialize
    @water = true
    @hit = false
  end

	def has_water?
		@water
	end

	def ship!
    @water = false
	end

	def has_ship?
		true
	end

	def has_hit?
		@hit
	end

	def hit!
		@hit = true
	end
end
