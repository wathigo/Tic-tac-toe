## control the game

require File.expand_path("../lib/script.rb")
#for other users just remove the '#'
#require File.expand_path("lib/script.rb")

puts "/////////////// Welcome to the tic_tac-toe game /////////////"

loop do
  player_1 = nil
  player_2 = nil
  loop do
    puts "Please enter Player_1 name"
    name = gets.chomp
    valid = name.scan(/\D/).empty?
    if valid
      puts "Invalid name!"
    else
      player_1 = Player.new(name)
      puts "PLAYER 1: #{player_1.name}"
      break
    end
  end
  puts "Please select you choice 'x' or 'o'"
  choice = gets.chomp.upcase!
  loop do
    if choice == 'X' || choice == 'O'
      player_1.choice = choice
      break
    else
      puts 'Enter a valid choice'
      choice = gets.chomp.upcase!
    end
  end


  loop do
    puts "Please enter Player_2 name"
    name = gets.chomp
    valid = name.scan(/\D/).empty?
    if valid
      puts "Invalid name!"
    else
      player_2 = Player.new(name)
      break
    end
  end
  if player_1.choice == 'X'
      player_2.choice = 'O'
  else
      player_2.choice = 'X'
  end
  puts "PLAYER 2 CHOICE: #{player_2.choice}"


  board = Board.new
  board.display

  puts "*** Start to Play Now ***"

  loop do
    begin
        puts "player_1 :Choose a place between 1 and 9"
        place = gets.chomp
        result = board.update(player_1.choice, place.to_i)
    rescue StandardError=>e
        puts "Error,You cannot use this place !: #{e}"
        puts 'Try again :)'
        retry
    end
    if result[0] == true
        puts "#{player_1.name} wins"
        break
    end
    if result[1] == 9
        puts "*** It is draw ***"
        break
    end
    begin
        puts "player_2 :Choose a place between 1 and 9"
        place = gets.chomp
        result = board.update(player_2.choice, place.to_i)
    rescue StandardError=>e
        puts "Error,You cannot use this place !: #{e}"
        puts 'Try again :)'
        retry
    end
    if result[0] == true
        puts "#{player_2.name} wins"
        break
    end
  end
  puts "Do you want to play again? (y / n)"
  break if gets.chomp == 'n'
end
