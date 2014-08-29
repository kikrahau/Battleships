module DisplayBoards

  def cell_content_for_current_player
    hash_values = []
    @cells.values.each do |cell|
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

 def cell_content_for_opponent
    hash_values = []
    @grid.values.each do |cell|
      if cell.hit && cell.cell_content != nil
        hash_values << "X".red
      elsif cell.hit
        hash_values << "O".green
      else
        hash_values << "~".black_on_blue   
      end
    end
    hash_values 
  end
end