class Ship


attr_accessor :floating, :badass_rating

DEFAULT_BADASS_RATING = 5

	def initialize
		@floating = true
		@badass_rating = DEFAULT_BADASS_RATING
	end

	def sink!
		@floating = false
		self
	end

end