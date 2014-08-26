require 'board'

describe Board do

  let(:board) { Board.new     }
  let(:water) { double :water }

	it "should know that it is a board" do
		expect(board).to be_a Board

	end

	it "should have a 100 cells" do
		expect(board.cells.count).to eq 100
	end

  it 'all cells should be initialized containing water' do
    expect(board.cells).to be_a Water
  end


end
