# frozen_string_literal: true

## control the game

require File.expand_path('../lib/script.rb')
# for other users just remove the '#'
# require File.expand_path("lib/script.rb")

def display(matrix)
  puts '---------'
  puts "#{matrix[0][0]} | #{matrix[0][1]} | #{matrix[0][2]}"
  puts '---------'
  puts "#{matrix[1][0]} | #{matrix[1][1]} | #{matrix[1][2]}"
  puts '---------'
  puts "#{matrix[2][0]} | #{matrix[2][1]} | #{matrix[2][2]}"
  puts '---------'
end



def validate_name(name)
  loop
    valid = name.scan(/\D/).empty?
    if valid
      puts "Enter a valid name!"
      name = gets.chomp
    else
      name
      break
    end
  end
end


def validate_choice(choice)
  loop do
    if choice == 'X' || choice == 'O'
    choice
    break
  else
    puts 'Enter a valid choice' 
    choice = gets.chomp.upcase!
  end
end

puts '/////////////// Welcome to the tic_tac-toe game /////////////'

player1 = nil
player2 = nil

puts 'Please enter player1 name'
name = gets.chomp
player1.name = validate_name(name)


puts "Please select you choice 'x' or 'o'"
choice = gets.chomp.upcase!
player1.choice = validate_choice(choice)


puts 'Please enter player2 name'
name = gets.chomp
player2.name = validate_name(name)

player2.choice = player1.choice == 'X' ? 'O' : 'X'
puts "PLAYER 2 CHOICE: #{player2.choice}"




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
