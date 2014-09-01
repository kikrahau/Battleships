require 'player'

describe Player do

let(:player)	{ Player.new }
let(:ship) 		{ double :ship }
let(:cell)		{ double :cell}
let(:cell2)		{ double :cell2}
let(:board)		{ double :board, grid: {"A1" => cell}}
let(:board2)	{ double :board, grid: {"A1" => cell2, "A2" => cell2}}
let(:player_with_board)	{ Player.new(board) }
let(:player_with_board2)	{ Player.new(board2) }


	it 'can be able to fire missiles at grids' do
		expect(cell).to receive(:hit!)
		player_with_board.fire_missile_at("A1")
	end

	it 'can place ships on the board horizontally' do
			destroyer = double :ship, badass_rating: 2
			allow(cell2).to receive(:deploy!)
			player_with_board2.place(destroyer, "A1", "horizontal")
	end

	it "can return all coordinates for a coordiante horizontally" do 
		expect(player.coordinates_for("a1", 4, "horizontal")).to eq ["A1", "A2", "A3", "A4"]
	end

	it "can return all coordinates for a coordiante vertically" do 
		expect(player.coordinates_for("a1", 4, horizontally: false)).to eq ["A1", "B1", "C1", "D1"]
	end

end
