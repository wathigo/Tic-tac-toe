# frozen_string_literal: true

# spec/tic_tac_toe_spec.rb
# require File.expand_path('./enumerable.rb')
require File.expand_path('../lib/script.rb')
require File.expand_path('../bin/main.rb')

RSpec.describe Enumerable do
  #=begin
  describe '#my_each_with_index' do
    let(:arr) { [2, 4, 6] }
    let(:result) { [] }
    it 'find each item with his index' do
      arr.my_each_with_index { |x, i| result.push("#{i} index of #{x}") }
      expect(result).to eql(['0 index of 2', '1 index of 4', '2 index of 6'])
    end
    it 'return the original array' do
      expect(arr.my_each_with_index do |x, i|
               result.push("#{i} index \
                     of #{x}")
             end).to eql(arr)
    end
  end
  #=end
end