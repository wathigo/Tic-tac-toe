# frozen_string_literal: true
# spec/main_spec.rb

require File.expand_path('../bin/main.rb')
#require File.expand_path('../lib/main.rb')

yes_gets = double("yes_gets")

RSpect.describe 'name' do
    context 'when user starts game' do
        def validate_name(name)
            loop do
            valid = name.scan(/\D/).empty?
            if valid
                puts "Enter a valid name!"
                name = gets.chomp
            else
                return name
                break
            end
            end
        end
  
    it 'the game should start' do
        allow($stdin).to receive(:gets).and_return(yes_gets)
        allow_any_instance_of(Kernel)
            .to receive(:gets)
            .and_return('y', 'p1_name', 'p2_name')

        expect(yes_gets).to receive(:chomp).and_return('y')
        expect { start_game }
            .to output(/Ok, let's start!/)
            .to_stdout
    end
  end
end
  




