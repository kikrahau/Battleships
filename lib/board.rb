# require 'water'

class Board

  def initialize(width, height)
  	@cells = {}
  	@width = width
  	@height = height
  end

  def access_grid(a,b)
  	if !a.is_a? String or (a.ord - "a".ord) < 0 or \
  		(a.ord - "a".ord) >= @width or !b.is_a?(Integer) or \
  		b <= 0 or b > @height 
  		raise ArgumentError.new('Input incorrect')
  	end
  	cell_value = @cells[a + b.to_s]
  end

end
