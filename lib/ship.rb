class Ship


attr_accessor :floating, :badass_rating

DEFAULT_BADASS_RATING = 5

	def initialize(badass_rating = DEFAULT_BADASS_RATING)
		@floating = true
		@badass_rating = badass_rating
	end

	def hit_counter
		@badass_rating -= 1
		sink! if @badass_rating == 0
	end

	def sink!
		@floating = false
		self
	end

	class CannibalSubmarine < Ship
		def initialize
			super(2)
		end		
	end

	class AircraftCarrier < Ship
		def initialize
			super(3)
		end		
	end

	class Destroyer < Ship
		def initialize
			super(4)
		end
	end

end



