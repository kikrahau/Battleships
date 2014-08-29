class Ship


attr_accessor :floating, :badass_rating

DEFAULT_BADASS_RATING = 3

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


	class PaddleBoat < Ship
		def initialize
			super(2)
		end		
	end

	class Destroyer < Ship
		def initialize
			super(4)
		end
	end

	class AircraftCarrier < Ship
		def initialize
			super(5)
		end		
	end

	class GunbustingBattleship < Ship
	end

	class CannibalSubmarine < Ship
	end

end



