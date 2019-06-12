## control the game

require '../lib/script'

puts "/////////////// Welcome to the tic_tac-toe game /////////////"

puts "Please enter Player_1 name"
player_1 = Player.new(gets.chomp)

puts "Please select you choice 'x' or 'o'"
player_1.choice = gets.chomp

puts "Please enter Player_2 name"
player_2 = Player.new(gets.chomp)

puts "Please select you choice 'x' or 'o'"

if player_1.choice == 'x'
    player_2.choice =='o'
else
    player_2.choice =='x'
end



board = Board.new
board.dispaly

puts "Start to Play Now"

loop
    puts "player_1 :Choose a place between 1 and 9"
    place = gets.chomp
    result = board.update(player_1.choice,place)
    puts "#{player_1.name} wins" if result[0] == true 
    puts "It is draw" if result[1] == 9
    end  
end


