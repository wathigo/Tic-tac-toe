# frozen_string_literal: true

## control the game

require File.expand_path('../lib/script.rb')
require File.expand_path('./main_helper.rb')
# require File.expand_path("lib/script.rb")


puts "/////////////// Welcome to the tic_tac-toe game /////////////"
players = rtn_players
player1 = players[0]
player2 = players[1]

loop do
  board = Board.new
  matrix = board.matrix
  display(matrix)

  puts '*** Start to Play Now ***'

  loop do
    begin
      puts 'player1 :Choose a place between 1 and 9'
      place = gets.chomp
      result = board.update(player1.choice, place.to_i)
      display(result[2])
    rescue StandardError
      puts "Error,You cannot use this place ! \n Try again :)"
      retry
    end
    if result[0] == true
      puts "#{player1.name} wins"
      player1.score += 1
      puts "#{player1.name} score is: #{player1.score}"
      puts "#{player2.name} score is: #{player2.score}"
      break
    end
    if result[1] == 9
      puts '*** It is draw ***'
      puts "#{player1.name} score is: #{player1.score}"
      puts "#{player2.name} score is: #{player2.score}"
      break
    end
    begin
      puts 'player2 :Choose a place between 1 and 9'
      place = gets.chomp
      result = board.update(player2.choice, place.to_i)
      display(result[2])
    rescue StandardError
      puts "Error,You cannot use this place ! \n Try again :)"
      retry
    end
    next unless result[0] == true

    puts "#{player2.name} wins"
    player2.score += 1
    puts "#{player1.name} score is: #{player1.score}"
    puts "#{player2.name} score is: #{player2.score}"
    break
  end

  puts 'Do you want to play again? (y / n)'
  break if gets.chomp == 'n'
end
