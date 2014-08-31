require './lib/player'
require_relative './display_boards'

class Game

	include DisplayBoards

	FLEET = [Ship::PaddleBoat.new,Ship::Destroyer.new,Ship::AircraftCarrier.new,Ship::GunbustingBattleship.new,Ship::CannibalSubmarine.new]

	attr_accessor :players

	def initialize
		@players = []
		@player_1_name = ""
		@player_2_name = ""
	end

	def add!(player)
		@players << player
	end

# we should add the players automatically to the game once names are collected
# we should change the "player name" to name that was given on input

	def get_name_player_1
		p "Please enter name of Player 1:"
		@player_1_name = gets.chomp
		# chomp = gets rid of the new line aka 'hello\n' is now 'hello'
		# '' vs "" = single quotes will put exactly what is written, while "" will EVALUATE instructions that are within the string
		if @player_1_name == ""
			@player_1_name = "Player 1"
		end
		@player_1_name
	end

	def get_name_player_2
		p "Please enter name of Player 2:"
		@player_2_name = gets.chomp
		if @player_2_name == ""
			@player_2_name = "Player 2"
		end
		@player_2_name
	end

	def place_ship(ship)
		p "Please deploy your #{ship}"
		p "what coordinate would you like to use?"

		at_coordinate = gets.chomp
		p "what direction would you like to place said ship?"
		direction = gets.chomp
		@player.place(ship, at_coordinate, direction)
	end

	def starting?
		@players.count == 2
	end

	def current_player
		@players.first
	end

	def other_player
		@players.last
	end

	def change_turns
		@players.rotate!
	end

	def own_board
		current_player.board.cell_content_for_current_player
		other_player.board.cell_content_for_opponent
	end

	def opponents_board
		other_player.board.cell_content_for_current_player
		current_player.board.cell_content_for_opponent
	end

end













