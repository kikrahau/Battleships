require 'player'

describe Player do 

let(:player) { Player.new }
let(:cell) {double :cell}

	it 'should be able to fire missiles at the shameless rebel ships' do
		expect(cell).to receive(:hit)
		expect(player.fire_missile_at(cell)).to eq nil
	end

	it 'should change the status of a cell from blank to hit' do
		allow(cell).to receive(:hit).and_return(true)
		player.fire_missile_at(cell)
	end

	it 'should be able to place ships on the War Room Map' do
		allow(cell).to receive(:occupation)
		expect(player.place_ship(cell)).to eq nil
	end




end