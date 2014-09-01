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

	def cell_content=(content)
		@cell_content = content
	end

	def deploy!(ship)
		@cell_content = ship
	end

	def has_ship?
		return true unless @cell_content == nil
	end

	def has_hit?
		@hit
	end

	def hit!
		raise "HAHAHAAAAA YOU FOOLS!!! YOU ALREADY HIT THERE!!!" if @hit == true
			if has_ship?
				@cell_content.hit_counter
			end
		@hit = true
		# self
	end

end
