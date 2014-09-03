require './lib/game'

module Rules

	def get_name_player_1(name)
		@player_1_name = name
		if @player_1_name == ""
			@player_1_name = "Player 1"
		end
		@player_1_name
	end

	def get_name_player_2(name)
		@player_2_name = name
		if @player_2_name == ""
			@player_2_name = "Player 2"
		end
		@player_2_name
	end

	def placement_phase
		@fleet.each do |ship|
			p "Where would you like to place the #{ship.name}?"
			p "It occupies #{ship.badass_rating} squares."
			ship_coordinate = gets.chomp
			current_player.board.check_coordinate(ship_coordinate)
			p "Which direction? Type H for horizontal or V for vertical"
			direction = gets.chomp
			if direction == "H"
				direction = "horizontal"
			else
				direction = "vertical"
			end
			place_ship(ship, ship_coordinate, direction)
		end
		p "All ships have been placed!"
	end

	def shooting_phase
		p "Where would you like to shoot?"
		p "Please type the coordinates in the form of A1 or C4"
		shot_coordinate = gets.chomp
		other_player.board.check_coordinate(shot_coordinate)
		player_fire_missile(shot_coordinate)
		update_fleet
	end

	def placing_turn
		2.times { placement_phase;change_turns }
	end

	def shooting_turn
		until game_over
			shooting_phase
			change_turns
		end
	end
end