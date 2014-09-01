require 'game'

class Rules < Game

	def placement_phase
		FLEET.each do |ship|	
			p "Where would you like to place #{ship}?"
			p "It occupies #{ship.badass_rating} squares."
			ship_coordinate = gets.chomp
			p "Which direction? Type H for horizontal or V for vertical"
			direction = gets.chomp
			if direction == "V"
				direction = "Horizontal"
			elsif direction == "H"
				direction = "Vertical"
			end
			place_ship(ship, ship_coordinate, direction)
		end
	end

end