require 'game'


describe Game do

	let(:game) { Game.new }

	let(:player1) { double :player, board: :just_a_board, fleet: :ship_here }
	let(:player2) { double :player, board: :just_a_board, fleet: :ship_here }
	let(:ship) { double :ship }

	context 'initialization' do

		it 'should not be initialized with players' do
			expect(game.players).to eq []
		end

		it 'should be able to add players' do
			game.add!(player1)
			expect(game.players).to eq [player1]
		end

		it 'should be able to know, when to start' do
			game.add!(player1)
			game.add!(player2)
			expect(game).to be_starting
		end

		it "should be able to start, when there are two players" do
			game.add!(player1)
			game.add!(player2)
			expect(game.starting?).to be true
		end

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

	context "Ship placement" do

		it "should ask the player to deploy their first ship" do
			allow(game).to receive(:gets).and_return("A1")
			allow(game).to receive(:gets).and_return("Horizontal")
			expect(game.place_ship(ship)).to be true
		end

	end

	context "Game play - attack mode" do

		it 'should know who is the current player' do
			game.add!(player1)
			game.add!(player2)
			expect(game.current_player).to eq game.players.first
		end

		it 'should know who is the other player' do
			game.add!(player1)
			game.add!(player2)
			expect(game.other_player).to eq game.players.last
		end

		it 'should change turns' do
			player1 = game.current_player
			player2 = game.other_player
			game.change_turns
			expect(game.current_player).to eq player2
		end

	end

	it "should have access to the current players board" do
		game.add!(player1)
		allow(player1).to receive(:board).and_return(:board)
		expect(game.own_board).to eq :board
	end

	it 'should have access to other players board' do
		game.add!(player1)
		game.add!(player2)
		allow(player2).to receive(:board).and_return(:board)
		expect(game.opponents_board).to eq :board
	end
end
















