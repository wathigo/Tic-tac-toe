# frozen_string_literal: true

# implementing the player class

class Player
  attr_accessor :choice
  attr_reader :name
  def initialize(name)
    @choice = nil
    @name = name
  end
end
# implementing the Board class
class Board
  attr_writer :matrix
  def initialize
    @counter = 0
    @matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def update(choice, place)
    if place <= 3
      @matrix[0][@matrix[0].index(place)] = choice

    elsif place <= 6
      @matrix[1][@matrix[1].index(place)] = choice

    else
      @matrix[2][@matrix[2].index(place)] = choice
    end
    display
    result = Result.new(@matrix)
    result.check_success
    @counter += 1
    [result.check_success, @counter]
  end

  def display
    puts '---------'
    puts "#{@matrix[0][0]} | #{@matrix[0][1]} | #{@matrix[0][2]}"
    puts '---------'
    puts "#{@matrix[1][0]} | #{@matrix[1][1]} | #{@matrix[1][2]}"
    puts '---------'
    puts "#{@matrix[2][0]} | #{@matrix[2][1]} | #{@matrix[2][2]}"
    puts '---------'
  end
end

class Result
  def initialize(matrix)
    @matrix = matrix
  end

  public

  def check_success
    check_row || check_diagonal || check_column
  end

  private

  def check_row
    if @matrix[0][0] == @matrix[0][1] && @matrix[0][1] == @matrix[0][2] ||
       @matrix[1][0] == @matrix[1][1] && @matrix[1][1] == @matrix[1][2] ||
       @matrix[2][0] == @matrix[2][1] && @matrix[2][1] == @matrix[2][2]
      return true
    end

    false
  end

  def check_column
    if @matrix[0][0] == @matrix[1][0] && @matrix[1][0] == @matrix[2][0] ||
       @matrix[0][1] == @matrix[1][1] && @matrix[1][1] == @matrix[2][1] ||
       @matrix[0][2] == @matrix[1][2] && @matrix[1][2] == @matrix[2][2]
      return true
    end

    false
  end

  def check_diagonal
    if @matrix[0][0] == @matrix[1][1] && @matrix[1][1] == @matrix[2][2] ||
       @matrix[2][0] == @matrix[1][1] && @matrix[1][1] == @matrix[0][2]
      return true
    end

    false
  end
end

new_board = Board.new
new_board.update('x', 1)
