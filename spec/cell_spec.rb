require "cell"

describe Cell do

	let(:cell)   { Cell.new     }
  let(:ship)   { double :ship }
  let(:player) { double :player }

	it "should initially have content of water" do
		expect(cell.cell_content?).to be nil
	end

	it "should be able to change to contain a ship" do
		expect(cell.deploy!(ship)).to be ship
	end

  it "should know if it contains ship" do
    cell.deploy!(ship)
    expect(cell.has_ship?).to be true
  end

	it 'should initially be clear, not containing any hits' do
		expect(cell.has_hit?).to be false
	end

	it 'should be able to register a hit' do
		cell.hit!
		expect(cell.has_hit?).to be true
	end

  it 'should send a hit to ship, if occupied by a ship' do
    cell.deploy!(ship)
    expect(ship).to receive(:hit_counter)
    cell.hit!
    # should there be another test here to ensure change made
  end

  it 'should not allow a missile to land in the same spot twice' do
    cell.hit!
    expect{(cell.hit!)}.to raise_error
  end

end














