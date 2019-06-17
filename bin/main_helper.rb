# frozen_string_literal: true

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
  loop do
    valid = name.scan(/\D/).empty?
    if valid
      puts 'Enter a valid name!'
      name = gets.chomp
    else
      return name
      break
    end
  end
end

def validate_choice(choice)
  loop do
    arr = %w[X O]
    if arr.include? choice
      return choice
    else
      puts 'Enter a valid choice'
      choice = gets.chomp.upcase!
    end
  end
end

def rtn_players
  puts 'Please enter player1 name'
  name = $stdin.gets.chomp
  player1 = Player.new(validate_name(name))

  puts "Please select you choice 'x' or 'o'"
  choice = $stdin.gets.chomp.upcase!
  player1.choice = validate_choice(choice)

  puts 'Please enter player2 name'
  name = $stdin.gets.chomp
  player2 = Player.new(validate_name(name))

  player2.choice = player1.choice == 'X' ? 'O' : 'X'
  puts "PLAYER 2 CHOICE: #{player2.choice}"
  puts "PLAYER 1 CHOICE: #{player1.choice}"
  [player1, player2]
end
