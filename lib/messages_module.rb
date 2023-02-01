# frozen_string_literal: true

# Module to define helper methods that ask for values
module Messages
  def ask_name(num)
    puts "\nPlayer #{num}, write your name"
    gets.chomp
  end

  def ask_symbol
    puts "\nWrite a symbol/letter to represent you in the board!"
    gets.chomp[0]
  end

  def ask_space(player)
    puts "\n#{player.name} select the space to put your symbol! (1..9)"
    gets.chomp[0].to_i
  end
end
