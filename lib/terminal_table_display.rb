require_relative './lib/display_boards'

class TerminalTableDisplay

include DisplayBoards

	 def display_board
    rows = []
    two_dimension_array.each {|row| rows << row}
    table = Terminal::Table.new :title => "Battleships", :headings => (0..@height).to_a, :rows => rows
    p table 
  end

  def display_for_current_player
  	cell_content_for_current_player
  end

  def display_for_opponent
  	cell_content_for_opponent
  end

  def two_dimension_array
    display_array = cell_content_for_display.each_slice(@width).map{|row| row}
    letter_coord.each_with_index{|row_letter, index| display_array[index].insert(0, row_letter)}
    display_array
  end

end