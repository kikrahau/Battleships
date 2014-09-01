require 'rules'
require 'game'
require 'game_spec'

describe Rules do 

			let(:board) { Board.new }
			let(:player) { Player.new(board) }
			let(:rules) { Rules.new }

	context "ship placement phase" do

		it "can prompt player 1 and then player 2 to place ships" do 
			rules.add!(player)
			allow(rules).to receive(:gets).and_return("A1", "H","B1", "H","C1", "H", "A9", "V","D9", "V")
			rules.placement_phase
			expect(rules.own_board(player).select {|ship| ship == "S"}.count).to eq(17)

		end	


	end

end