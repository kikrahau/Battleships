class Cell

  def initialize
    @water = true
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
end
