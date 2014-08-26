require "cell"

describe Cell do

	let(:cell) { Cell.new }

	it "should initially contain water" do
		expect(cell.has_water?).to be true
	end

	it "should be able to change to contains ship" do
		cell.ship!
		expect(cell.has_ship?).to be true
	end

  it 'when a ship is present water state changes to false' do
    cell.ship!
    expect(cell.has_water?).to eq false
  end



end
