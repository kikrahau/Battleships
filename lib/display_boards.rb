module DisplayBoards

  def cell_content_for_current_player(player)
    hash_values = []
    player.board.grid.values.each do |cell|
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

def cell_content_for_opponent(player)
	hash_values = []
	player.board.grid.values.each do |cell|
		if cell.hit && cell.cell_content != nil
			hash_values << "X"
		elsif cell.hit
			hash_values << "O"
		else
			hash_values << "~"  
		end
	end
	hash_values 
end

end