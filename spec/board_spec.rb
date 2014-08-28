require 'board'

describe Board do

  let(:board) { Board.new(1,1) }
  let(:cell)  { double :cell }


	it "should know that it is a board made of hashes" do
  	expect(board.create_cells).to be_a Hash
	end

  it "should be able to convert width to an alphabet array" do
    expect(board.convert_width).to eq "A"
  end

  it 'should create as many cells as height x width' do
    expect(board.create_cells).to eq Hash["A1", cell]
  end

  it 'can test that a grid point is valid' do
  		expect(board.check_coordinate("A1")).to eq nil
  end

  it "should raise an error messages if incorrect gridpoint is given" do
  		expect{board.check_coordinate("D100")}.to raise_error ArgumentError
  end

end
