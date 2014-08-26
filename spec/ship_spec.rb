require './lib/ship'

describe Ship do

	let(:ship) { Ship.new }

		it "should have floating status upon initialization" do
			expect(ship.floating).to eq true
		end

		it "should be able to sink" do
			expect(ship.sink!.floating).to eq false
		end



	end