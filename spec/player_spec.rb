require 'player'

describe Player do

let(:player)	{ Player.new }
let(:ship) 		{ double :ship }
let(:cell)		{double :cell}
let(:board)		{ double :board, grid: {"A1" => cell}}
let(:player_with_board)	{ Player.new(board) }


	it 'can be able to fire missiles at grids' do
		expect(cell).to receive(:hit!)
		player_with_board.fire_missile_at("A1")
	end

	xit 'can place ships on the board horizontally' do
			destroyer = double :ship, badass_rating: 2
			own_grid = double :grid
			at_coordinate = "A1"
			# expect(own_grid).to receive(:[]).with(at_coordinate).and_return(grid)
			# expect(grid).to receive(:deploy!).with(destroyer)
			player_with_board.place(destroyer, "A1", "horizontal")
			# expect(player.coordinates_for("a1", 4, "horizontal")).to eq ["A1", "A2", "A3", "A4"]
	end

	it "can get return all coordinates for a coordiante horizontally" do 
		expect(player.coordinates_for("a1", 4, "horizontal")).to eq ["A1", "A2", "A3", "A4"]
	end

	it "can get return all coordinates for a coordiante vertically" do 
		expect(player.coordinates_for("a1", 4, horizontally: false)).to eq ["A1", "B1", "C1", "D1"]
	end

end

