# implementing the player class

class Player
    attr_writer :choice
    attr_reader :name
    def initialize (name)
        @choice = nil
        @name = name
    end
end
# implementing the Board class
class Board
    attr_writer :matrix
    attr_writer :choice
    attr_reader :name
    def initialize ()
        @matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    end
    def update (choice,place)
        if place <=3
            @matrix[0][@matrix[0].index(place)] = choice
        
        elsif place <=6
            @matrix[1][@matrix[1].index(place)] = choice
    
        else 
            @matrix[2][@matrix[2].index(place)] = choice
        end
        
    end
    def display ()
        print"#{@matrix[0]}\n #{@matrix[1]}\n #{@matrix[2]}\n"
    end 
end
new_board = Board.new
new_board.update('x',1)
new_board.display

    
