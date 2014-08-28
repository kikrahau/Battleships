require './lib/cell'

class Board

attr_accessor :cells

  def initialize(width, height)
    @width = width
  	@height = height
    @cells = create_cells
  end

  def convert_width
    (@width + 64).chr
  end

  def check_coordinate(coordinate)
    x = coordinate[0]
    y = coordinate[1..2].to_i
  	if !x.is_a? String or (x.ord - "A".ord) < 0 or \
  		(x.ord - "A".ord) >= @width or !y.is_a?(Integer) or \
  		y <= 0 or y > @height
  		raise ArgumentError.new('Input incorrect')
  	end
  end

  def create_cells
    letters = ("A"..convert_width).to_a
    numbers = (1..@height).to_a
    board = letters.map { |letter| numbers.map { |number| "#{letter}#{number}" }}
    Hash[board.flatten.map { |key, value| [key, Cell.new] }]
  end

end
