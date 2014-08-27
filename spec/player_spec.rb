require 'player'

describe Player do 

let(:player)	{ Player.new }
let(:cell) 		{ double :cell }
let(:ship) 		{ double :ship }

	xit 'should be able to fire missiles at the shameless rebel ships' do
		expect(cell).to receive(:hit)
		player.fire_missile_at(cell)
	end

	it 'should be able to place ships on the War Room Map' do
		allow(cell).to receive(:occupation)
		player.place_ship(cell)
	end

	it 'should have a ship yard containing ships' do
		expect(player.ships).to eq []
	end

end