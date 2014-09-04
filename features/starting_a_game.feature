Feature: Starting the game
	In order to play battleships
	As a nostalgic player
	I want to start a new game

	Scenario: Registering
		Given I am on the hompage
		When I follow "New Game"
		Then I should see "What's your name?"

	Scenario: Add name input
		Given I am on the new game page
		When I fill "player" with "Nick"
		And I press "Go!"
		Then I should see "Thank you Nick"

	Scenario: Registering Error Player
		Given I am on the new game page
		When I fill "player" with ""
		And I press "Go!"
		Then I should not see "Thank you"
		And I should see "Please re-enter your name"

	Scenario: Registering a second player
		Given "Nick" has registered
		And I am on the new game page
		When I fill "player" with "Michelle"
		And I press "Go!"
		Then I should see "Thank you Michelle"

	Scenario: Trying to register a third player
		Given I am on the new game page
		And "Nick" and "Michelle" have registered
		When I fill "player" with "Ruth"
		And I press "Go!"
		Then I should see "Sorry, the battleship server is currently full"