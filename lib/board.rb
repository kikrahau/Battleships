require './lib/cell'
require 'terminal-table'

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

  def draw_board
    rows = []
    board = two_dimension_array
    board.each {|row| rows << row}
    table = Terminal::Table.new :title => "Battleships", :headings => (1..@height).to_a, :rows => rows
    puts table 
  end

  def cell_content_for_display
    hash_values = []
    @cells.values.each do |cell|
      if cell.hit && cell.cell_content != nil
        hash_values << "X"
      elsif cell.hit
        hash_values << "O"
      elsif cell.cell_content != nil
        hash_values << "S"
      else
        hash_values << "~"    
      end
    end
    hash_values 
  end

  def two_dimension_array
    letters = ("A"..convert_width).to_a
    display_array = cell_content_for_display.each_slice(@width).map{|row| row}
    letters.each_with_index{|row_letter, index| display_array[index].insert(0, row_letter)}
    display_array
  end
end


