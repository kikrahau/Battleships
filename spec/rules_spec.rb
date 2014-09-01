require 'rules'
require 'game'
require 'game_spec'

describe Rules do 

			let(:board) { Board.new }
			let(:player1) { Player.new(board) }
			let(:player2) { Player.new(board) }

			let(:rules) { Rules.new }

	context "ship placement phase" do

		it "can prompt player to place ships" do 
			rules.add!(player1)
			allow(rules).to receive(:gets).and_return("A1","V","A2","V","A3","V","A4","V","A5","V")
			rules.placement_phase
			expect(rules.own_board(player1).select {|ship| ship == "S"}.count).to eq(17)
		end	

		it "can prompt player to take a shot at a coordinate" do
			rules.add!(player1)
			rules.add!(player2)
			allow(rules).to receive(:gets).and_return("A1")
			rules.shooting_phase			
			expect(player2.board.grid["A1"].has_hit?).to be true
		end

		it "can let players shoot, until all ships of one player are sunk" do
			
		end
	end

end