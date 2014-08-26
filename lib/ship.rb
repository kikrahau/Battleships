class Ship

attr_accessor :floating

	def initialize
		@floating = true
	end

	def sink!
		@floating = false
		self
	end

end