require 'rules'
require 'game'
require 'game_spec'

describe Rules do 

			let(:board) { Board.new }
			let(:player) { Player.new(board) }
			let(:rules) { Rules.new }

	context "ship placement phase" do

		it "can prompt player to place ships" do 
			rules.add!(player)
			allow(rules).to receive(:gets).and_return("A1","V","A2","V","A3","V","A4","V","A5","V")
			rules.placement_phase
			expect(rules.own_board(player).select {|ship| ship == "S"}.count).to eq(17)
		end	

		it "can let players place their ships, one at a time" do

		end

	end

end