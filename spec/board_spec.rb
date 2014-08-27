require 'board'

describe Board do

  let(:board) { Board.new(10,10) }
  let(:water) { double :water }

	# it "should know that it is a board" do
	# 	expect(board).to be_a Board

	# end

	# it "should have a 100 cells" do
	# 	expect(board.cells.count).to eq 100
	# end
 #  xit 'all cells should be initialized containing water' do
 #    expect(board.cells.all_water?).to be true
 #  end

  it 'should create an array of hashes' do 
  		expect(board.access_grid("d",4)).to eq nil
  end

  it "should raise an error messages if incorrect gridpoint is given" do
  		expect{board.access_grid("d",100)}.to raise_error ArgumentError
  end	

end
