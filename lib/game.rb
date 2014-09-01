require './lib/player'
require './lib/display_boards'
require './lib/board'

class Game

	include DisplayBoards

	attr_accessor :players, :fleet

	def initialize
		@players = []
		@fleet = [Ship::PaddleBoat.new,Ship::Destroyer.new,Ship::AircraftCarrier.new,Ship::GunbustingBattleship.new,Ship::CannibalSubmarine.new]
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

	def place_ship(ship, ship_coordinate, direction)
		current_player.place(ship, ship_coordinate, direction)
	end

	def player_fire_missile(fire_coordinate)
		other_player.fire_missile_at(fire_coordinate)
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

	def own_board(current_player)
		cell_content_for_current_player(current_player)
	end

	def opponents_board(other_player)
		cell_content_for_opponent(other_player)
	end

	def update_fleet
		@fleet.reject! { |ship| ship.floating ==  false }
	end

	def fleet_count
		@fleet.count
	end

	def game_over
		fleet.count == 0
	end
end

