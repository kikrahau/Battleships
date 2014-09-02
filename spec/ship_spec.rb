require './lib/ship'

describe Ship do

	let(:ship) 			{ Ship.new }
	let(:destroyer) 	{ Ship::Destroyer.new }
	let(:paddleboat) 	{ Ship::PaddleBoat.new }
	let(:carrier) 		{ Ship::AircraftCarrier.new }
	let(:battleship)	{ Ship::GunbustingBattleship.new }
	let(:submarine) 	{ Ship::CannibalSubmarine.new }


	it "should have floating status upon initialization" do
		expect(ship.floating).to eq true
	end

	it "should be able to sink" do
		expect(ship.sink!.floating).to eq false
	end

	it 'should know just how BADASS it is upon initialization' do
		expect(ship.badass_rating).to eq 3
	end

	it 'should acknowledge each time it gets wounded in battle by cowards!!!!' do
		ship.hit_counter
		expect(ship.badass_rating).to eq 2
	end

	it 'should tally up the missile hits for future retribution!!!' do
		Ship::DEFAULT_BADASS_RATING.times{ship.hit_counter}
		expect(ship.floating).to eq false
	end

	context "testing subclasses" do
		it 'should be able to have a subclass Destroyer' do
			destroyer = Ship::Destroyer.new
			expect(destroyer.is_a? Ship).to eq true
		end

		it 'should have a different badass rating' do
			expect(destroyer.badass_rating).to eq 4
		end

		it "should have their individual name" do
			expect(destroyer.name).to be :Destroyer
		end
	end

 end