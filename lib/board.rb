require 'water'

class Board


  def initialize
  	
  end

  def cells
    @cells ||= Array.new(100) { Water.new }
  end

end
