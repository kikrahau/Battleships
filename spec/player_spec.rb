require 'player'

describe Player do

let(:player)	{ Player.new }
let(:grid) 		{ double :grid }
let(:ship) 		{ double :ship }
let(:board)		{ double :board, grid: grid}

	it 'should be able to fire missiles at grids' do
		opponent_grid  = double :grid
		opponent_board = double :board, grid: opponent_grid
		at_coordinate  = 'A1'

		expect(opponent_grid).to receive(:[]).with(at_coordinate).and_return(grid)
		expect(grid).to receive(:hit!)

		player.fire_missile_at(opponent_board, at_coordinate)
	end

	it 'can place ships on the board horizontally' do
		allow_message_expectations_on_nil
		grid      = double :grid
		destroyer = double :ship, badass_rating: 4
		player    = Player.new(board: board)
		locations = ["A1", "A2", "A3", "A4"]
		allow(board).to receive(:grid).and_return(grid)
		locations.each do |location|
			allow(grid).to receive(:[])
		end

		locations.each do |location|
			allow(board.grid[location]).to receive(:deploy!).with(destroyer)
		end

		player.place(destroyer, "A1", :horizontal)
	end

	it 'can place ships on the board vertically' do
		allow_message_expectations_on_nil
		grid      = double :grid
		destroyer = double :ship, badass_rating: 4
		player    = Player.new(board: board)
		locations = ["A1", "B1", "C1", "D1"]
		allow(board).to receive(:grid).and_return(grid)
		locations.each do |location|
			allow(grid).to receive(:[])
		end

		locations.each do |location|
			allow(board.grid[location]).to receive(:deploy!).with(destroyer)
	end

		player.place(destroyer, "A1", :vertical)
	end
end

