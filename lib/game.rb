require './lib/player'
require './lib/display_boards'
require './lib/board'
require './lib/rules'

class Game

	include Rules

	include DisplayBoards

	attr_accessor :players, :fleet

	def initialize
		@players = []
		@fleet = [Ship::PaddleBoat.new,Ship::Destroyer.new,Ship::AircraftCarrier.new,Ship::GunbustingBattleship.new,Ship::CannibalSubmarine.new]
		@player_1_name = ""
		@player_2_name = ""
	end

	def add!(player = Player.new(Board.new, @fleet))
		@players << player
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
		current_player.fleet.reject! { |ship| ship.floating ==  false }
	end

	def fleet_count
		@fleet.count
	end

	def game_over
		current_player.fleet.count == 0 || other_player.fleet.count == 0
	end

	def start_playing
		get_name_player_1
		get_name_player_2
		placing_turn
		shooting_turn
	end
end

