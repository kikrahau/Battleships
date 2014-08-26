require 'board'

describe Board do

	it "should know that it is a board" do
		board = Board.new
		expect(board).to be_a Board

	end

	it "should have a 100 cells" do
		expect(board.cells.count).to eq 100
	end 

end