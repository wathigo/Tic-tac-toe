# frozen_string_literal: true

# spec/tic_tac_toe_spec.rb
# require File.expand_path('./enumerable.rb')
require File.expand_path('./lib/script.rb')
#require File.expand_path('../bin/main.rb')

RSpec.describe Player do
  let(:player){Player.new("Jason")}
  describe '#Player.new' do
    it "Returns a player object with the name as one of the attribute" do
      expect(player.name).to eql("Jason")
    end
  end

  describe "#Player.choice" do
    it "Returns a player object with the attribute choice set to the given value" do
      player.choice = "x"
      expect(player.choice).to eql("x")
    end
  end
end

describe Board do
  let(:board) {Board.new}
  describe "#Board.new" do
    it "initializes two instant variables, matrix and counter" do
      expect(board.counter).to eql(0)
      expect(board.matrix).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end

  describe "#update" do
    it "Returns an array containing boolean, counter and matrix" do
      expect(board.update("X", 3)).to eql([false, 1, [[1, 2, "X"], [4, 5, 6], [7, 8, 9]]])
    end
  end
end

describe Result do
  let(:matrix){[[1, 2, 3], [4, 5, 6], [7, 8, 9]]}
  let(:result) {Result.new(matrix)}
  describe "#Result.new" do
    it "initializes an instant variable matrix with the value passed \
        as a parameter to the constructor" do
      expect(result.matrix).to eql(matrix)
      end
  end

  describe "#check_success" do
    let(:matching_row){[[1, 2, 3], ["X", "X", "X"], [7, 8, 9]]}
    let(:matching_column){[["X", 2, 3], ["X", 5, 6], ["X", 8, 9]]}
    let(:matching_diagonal){[["X", 2, 3], [4, "X", 6], [7, 8, "X"]]}
    let(:result1){Result.new(matching_row)}
    let(:result2){Result.new(matching_column)}
    let(:result3){Result.new(matching_diagonal)}
    it "Returns true when there is a matching row" do
      expect(result1.check_success).to eql(true)
    end

    it "Returns true when there is a matching column" do
      expect(result2.check_success).to eql(true)
    end

    it "Returns true when there is a matching diagonal" do
      expect(result3.check_success).to eql(true)
    end

    it "Returns false when there is no matching row or column or diagonal" do
      expect(result.check_success).to eql(false)
    end
  end
end
