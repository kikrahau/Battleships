class Ship


attr_accessor :floating, :badass_rating, :name

DEFAULT_BADASS_RATING = 3

	def initialize(badass_rating = DEFAULT_BADASS_RATING)
		@floating = true
		@badass_rating = badass_rating
		@name
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
			@name = :Paddleboat
		end		
	end

	class Destroyer < Ship
		def initialize
			super(4)
			@name = :Destroyer
		end
	end

	class AircraftCarrier < Ship
		def initialize
			super(5)
			@name = :Aircraftcarrier
		end		
	end

	class GunbustingBattleship < Ship
		@name = :GunbustingBattleship
	end

	class CannibalSubmarine < Ship
		@name = :CannibalSubmarine
	end

end



