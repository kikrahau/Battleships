class Display < Board

	def display_board
		rows = []
		two_dimension_array.each {|row| rows << row}
		table = Terminal::Table.new :title => "Battleships", :headings => (0..@height).to_a, :rows => rows
		puts table 
	end

	def cell_content_for_display
		hash_values = []
		@grid.values.each do |cell|
		  if cell.hit && cell.cell_content != nil
		    hash_values << "X".red
		  elsif cell.hit
		    hash_values << "O".green
		  elsif cell.cell_content != nil
		    hash_values << "S".yellow
		  else
		    hash_values << "~".black_on_blue   
		  end
	end
		hash_values 
	end

	def two_dimension_array
		display_array = cell_content_for_display.each_slice(@width).map{|row| row}
		letter_coord.each_with_index{|row_letter, index| display_array[index].insert(0, row_letter)}
		display_array
	end

end