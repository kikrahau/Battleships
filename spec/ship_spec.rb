require './lib/ship'

describe Ship do

	let(:ship) 		{ Ship.new }
	let(:destroyer) { Ship::Destroyer.new }
	# let(:cell) 	{ double :cell }

	it "should have floating status upon initialization" do
		expect(ship.floating).to eq true
	end

	it "should be able to sink" do
		expect(ship.sink!.floating).to eq false
	end

	it 'should know just how BADASS it is upon initialization' do
		expect(ship.badass_rating).to eq 5
	end

	it 'should acknowledge each time it gets wounded in battle by cowards!!!!' do
		ship.hit
		expect(ship.badass_rating).to eq 4
	end

	it 'should tally up the missile hits for future retribution!!!' do
		5.times{ship.hit}
		expect(ship.floating).to eq false
	end
	
	context "testing subclasses" do
		it 'should be able to have a subclass Detroyer' do
			destroyer = Ship::Destroyer.new
			expect(destroyer.is_a? Ship).to eq true	
		end

		it 'should have a different badass rating' do
			expect(destroyer.badass_rating).to eq 4
		end

	end

 end