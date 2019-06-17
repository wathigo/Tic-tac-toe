# frozen_string_literal: true

# spec/main_spec.rb
require File.expand_path('./bin/main_helper.rb')
# require File.expand_path('../lib/main.rb')

describe '#display' do
  let(:matrix) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
  it 'Should print to the standard output' do
    output = "---------\n1 | 2 | 3\n---------\n4 | 5 | 6\n---------\n7 | 8 | 9\n---------\n"
    expect { display(matrix) }.to output(output).to_stdout
  end
end

describe '#validate_name' do
  let(:valid_name) { 'Othamane' }
  it 'Returns the name if the name is valid' do
    expect(validate_name(valid_name)).to eql('Othamane')
  end
end

describe '#validate_choice' do
  let(:valid_choice1) { 'X' }
  let(:valid_choice2) { 'O' }
  it 'Returns the choice if the choice is valid' do
    expect(validate_choice(valid_choice1)).to eql('X')
  end
  it 'Returns the choice if the choice is valid' do
    expect(validate_choice(valid_choice2)).to eql('O')
  end
end

describe '#rtn_players' do
  let(:players) { rtn_players }
  it 'Returns player1 object' do
    allow($stdin).to receive(:gets).and_return('simon', 'x', 'Othamane')
    expect(players[0].name).to eql('simon')
  end
  it 'Returns player2 object' do
    allow($stdin).to receive(:gets).and_return('simon', 'x', 'Othamane')
    expect(players[1].name).to eql('Othamane')
  end
end
