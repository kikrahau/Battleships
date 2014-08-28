require './lib/cell'

class Board

attr_reader :cells

  def initialize(width, height)
  	@cells = {}
  	@width = width
  	@height = height
  end

  def convert_width
    (@width + 64).chr
  end

  def access_grid(a,b)
  	if !a.is_a? String or (a.ord - "a".ord) < 0 or \
  		(a.ord - "a".ord) >= @width or !b.is_a?(Integer) or \
  		b <= 0 or b > @height
  		raise ArgumentError.new('Input incorrect')
  	end
  	cell_value = @cells[a + b.to_s]
  end

  def create_cells
    letters = ("A"..convert_width).to_a
    numbers = (1..@height).to_a
    board = letters.map { |letter| numbers.map { |number| "#{letter}#{number}" }}
    Hash[board.flatten.map { |key, value| [key, nil] }]
  end

  def cell_count
    cells.count
  end

  def empty?
    cells.count == 0
  end

  # def receive_ship(ship, cell)
  #     cells << cell.ship!(ship)
  #     # cells << cell
  # end

end
