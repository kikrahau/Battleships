require './lib/ship'

describe Ship do

	let(:ship) { Ship.new }

		it "should have floating status upon initialization" do
			expect(ship.floating).to eq true
		end
	end