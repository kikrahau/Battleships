require 'player'

describe Player do

let(:player)	{ Player.new }
let(:cell) 		{ double :cell }
let(:ship) 		{ double :ship }
let(:board)		{ double :board, cell: cell}

	it 'should be able to fire missiles at cells' do
		opponent_cell  = double :cell
		opponent_board = double :board, cell: opponent_cell
		at_coordinate  = 'A1'

		expect(opponent_cell).to receive(:[]).with(at_coordinate).and_return(cell)
		expect(cell).to receive(:hit!)

		player.fire_missile_at(opponent_board, at_coordinate)
	end

	# xit 'should be able to place ships on the War Room Map' do				
	# 	at_coordinate  = 'A1'
	# 	# player.place_ship(ship)
	# 	expect(cell).to receive(:[]).with(at_coordinate).and_return(cell)
	# 	expect(cell).to receive(:ship_type) 

	# 	player.place_ship(board, at_coordinate).ship_type
	# end

	it 'should have a ship yard containing ships' do
		fleet  = [:paddleboat, :destroyer, :carrier, :gun_busting_battleship, :canibal_submarine]
		player = Player.new(fleet: fleet)
		expect(player.ships).to eq fleet
	end

	it 'can place ships on the board horizontally' do
		allow_message_expectations_on_nil
		grid      = double :grid
		destroyer = double :ship, badass_rating: 4
		player    = Player.new(fleet: [destroyer], board: board)
		locations = ["A1", "A2", "A3", "A4"]
		allow(board).to receive(:grid).and_return(grid)
		locations.each do |location|
			allow(grid).to receive(:[])
		end

		locations.each do |location|
			allow(board.grid[location]).to receive(:place)
		end

		player.place(destroyer, "A1", :horizontal)
	end

	it 'can place ships on the board vertically' do
		allow_message_expectations_on_nil
		grid      = double :grid
		destroyer = double :ship, badass_rating: 4
		player    = Player.new(fleet: [destroyer], board: board)
		locations = ["A1", "B1", "C1", "D1"]
		allow(board).to receive(:grid).and_return(grid)
		locations.each do |location|
			allow(grid).to receive(:[])
		end

		locations.each do |location|
			allow(board.grid[location]).to receive(:place).with(any_args())
	end

		player.place(destroyer, "A1", :vertical)
	end
end

