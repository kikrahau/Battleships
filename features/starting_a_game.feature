Feature: Starting the game
	In order to play battleships
	As a nostalgic player
	I want to start a new game

	Scenario: Registering
		Given I am on the hompage
		When I follow "New Game"
		Then I should see "what's your name?"
		When I fill "player" with "Nick"
				And I press "Go!"
		Then I should see "Thank you Nick"



