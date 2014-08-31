class Ship


attr_accessor :floating, :badass_rating

DEFAULT_BADASS_RATING = 3

	def initialize(badass_rating = DEFAULT_BADASS_RATING)
		@floating = true
		@badass_rating = badass_rating
		# should always when possible AVOID magic numbers!!! evil evil evil and meaningless...they dont tell you anything useful... what does 10 mean? 10 punches? 10 drinks?
	end

	def hit_counter
		@badass_rating -= 1
		sink! if @badass_rating == 0
	end

	def sink!
		@floating = false
		self
		# explain self!!! its to do with return values, LOOK THIS UP!!!!
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



