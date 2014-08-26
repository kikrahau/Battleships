# Battleships

## Description

This project is to develop more advanced skills in Object Orientated
design and programming.

The task is to build a game that model the paper-based game,
Battleships. Each player has a 10x10 two dimensional board which they place a number of
battleships of varying sizes.

Once each player places their ships on their board they takes turns to
take shots at their opponents board. If the square is occupied by
a ship the attacking player notes a hit and a miss if the grid is empty.

The game is over when all of one player's ships have been. The winner is
the player with ships left on the board.

## Domain Model

#### Classes

#####**Game**

######*Collaborators*
Player, Board, Ship

######*Responsibilities*
1. Initialise game
2. Reset Game
3. Keeps a tally of number of hits ship receives
4. Keeps score of overall games won
5. Declares the winner

######*Interactions*
The *Game* class is responsible for initialising the start of the game
by interacting with the *Player* class. Upon initialisation the *Board*
is created and the *Ships* are made ready.

Every time a *Ship* is hit the *Game* class keeps a tally. Once all ships have been hit, *Game* notifies the players of who has won the game.

**Player**

**Board**

#####**Ship**

######*Collaborators*
Player, Board, Game

######*Responsibilities*
1. Has 'Floating' status once initialized
2. Acknowledges hits
3. Tallys hits
4. Changes ship status to 'Sunk' after maximum hit number
5. Tells Game that its status is changed to 'removed from play'

######*Interactions*
The *Ship* class interects with the *Player* class once the game beings in order to gain its position on the board. It is responsible for knowing how many hits it can take/tally, before its status is changed from its initialized state of 'Floating' to 'Sunk'.

 Once 'Sunk', the *Ship* class interacts with the *Game* class to tell the *Game* class that the *Ship* class is no longer in action and in effect, removed from play.

The game
