require 'player'

describe Player do

let(:player)	{ Player.new }
let(:cell) 		{ double :cell }
let(:ship) 		{ double :ship }

	it 'should be able to fire missiles at cells' do
		opponent_cell  = double :cell
		opponent_board = double :board, cell: opponent_cell
		at_coordinate  = 'A1'

		expect(opponent_cell).to receive(:[]).with(at_coordinate).and_return(cell)
		expect(cell).to receive(:hit!)

		player.fire_missile_at(opponent_board, at_coordinate)
	end

	xit 'should be able to place ships on the War Room Map' do
		player.place_ship(ship)
		allow(cell).to receive(:ship!).with(any_args())
		expect(cell).to
	end

	xit 'should have a ship yard containing ships' do
		expect(player.ships).to eq []
	end

end