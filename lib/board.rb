require './lib/cell'
require 'terminal-table'
require 'colored'

class Board

  attr_accessor :grid

  def initialize(width = 10, height = 10)
    @width = width
  	@height = height
    @grid = create_grid
  end

  def check_coordinate(coordinate) #extract different or statements in individual methods
    x = coordinate[0]
    y = coordinate[1..2].to_i
  	if !x.is_a? String or (x.ord - "A".ord) < 0 or \
  		(x.ord - "A".ord) >= @width or !y.is_a?(Integer) or \
  		y <= 0 or y > @height
  		raise ArgumentError.new('Input incorrect')
  	end
  end

  def convert_width
    (@width + 64).chr
  end
  # refering to ascii values eg 64 = A

  def letter_coord
    ("A"..convert_width).to_a
  end

  # to_a creates an Array
  #(1..10).to_a => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

  def create_grid
    numbers = (1..@height).to_a
    board = letter_coord.map { |letter| numbers.map { |number| "#{letter}#{number}" }}
    Hash[board.flatten.map { |key| [key, Cell.new] }]
  end
  # flatten = makes arrays within arrays 'one'
  # its a loop within a loop!
  # key and cell here are now LINKED (get your terms right!)

end
