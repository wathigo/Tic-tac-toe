# frozen_string_literal: true

## control the game

require File.expand_path('../lib/script.rb')
require File.expand_path('./main_helper.rb')
# require File.expand_path("lib/script.rb")


puts "/////////////// Welcome to the tic_tac-toe game /////////////"
players = rtn_players
player1 = players[0]
player2 = players[1]

start_game(player1, player2)
