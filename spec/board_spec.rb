require 'board'

<<<<<<< HEAD
=======

>>>>>>> cb469429809d5b314919e50abcefb0c40da6997e
describe Board do

  let(:board) { Board.new     }
  let(:water) { double :water }

	it "should know that it is a board" do
		expect(board).to be_a Board

	end

<<<<<<< HEAD
	it "should have a 100 cells" do
		expect(board.cells.count).to eq 100
	end

  it 'all cells should be initialized containing water' do
    expect(board.cells).to be_a Water
  end


=======
	# it "should have a 100 cells" do
	# 	expect(board.cells.count).to eq 100
	# end
>>>>>>> cb469429809d5b314919e50abcefb0c40da6997e
end
