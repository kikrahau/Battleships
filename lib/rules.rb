require 'game'

class Rules < Game

	def placement_phase
		@fleet.each do |ship|	
			p "Where would you like to place #{ship}?"
			p "It occupies #{ship.badass_rating} squares."
			ship_coordinate = gets.chomp
			p "Which direction? Type H for horizontal or V for vertical"
			direction = gets.chomp
			if direction == "V"
				direction = "vertical"
			elsif direction == "H"
				direction = "horizontal"
			end
			place_ship(ship, ship_coordinate, direction)
		p "All ships have been placed!"
		end
	end

	def shooting_phase
		p "Where would you like to shoot?"
		p "Please type the coordinates in the form of A1 or C4"
		shot_coordinate = gets.chomp
		player_fire_missile(shot_coordinate)	
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


	def game
		placement_turn
		shooting_turn
	end
end