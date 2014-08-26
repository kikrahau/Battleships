require "cell"

describe Cell do

	let(:cell) { Cell.new }

	it "should initially contain water" do 
		expect(cell.has_water?).to be true
	end


end 