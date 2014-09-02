require 'game'
require 'game'
require 'game_spec'

describe Rules do 

	let(:board) { Board.new }
	let(:player1) { Player.new(board) }
	let(:player2) { Player.new(board) }
	let(:game) { Game.new }

	context 'nameing players' do

		it "should ask player 1 for their name" do
			allow(game).to receive(:gets).and_return("Nick")
			expect(game.get_name_player_1).to eq "Nick"
		end

		it "should raise error if player 1 doesn't enter a name" do
			allow(game).to receive(:gets).and_return("\n")
			expect(game.get_name_player_1).to eq("Player 1")
		end

		it "should ask player 2 for their name" do
			allow(game).to receive(:gets).and_return("Merve")
			expect(game.get_name_player_2).to eq "Merve"
		end

		it "should raise error if player 2 doesn't enter a name" do
			allow(game).to receive(:gets).and_return("\n")
			expect(game.get_name_player_2).to eq("Player 2")
		end
	end

	context "ship placement phase" do

		it "can prompt player to place ships" do 
			game.add!(player1)
			allow(game).to receive(:gets).and_return("A1","V","A2","V","A3","V","A4","V","A5","V")
			game.placement_phase
			expect(game.own_board(player1).select {|ship| ship == "S"}.count).to eq(17)
		end	

		it "can prompt player to take a shot at a coordinate" do
			game.add!(player1)
			game.add!(player2)
			allow(game).to receive(:gets).and_return("A1")
			game.shooting_phase			
			expect(player2.board.grid["A1"].has_hit?).to be true
		end

	end

end