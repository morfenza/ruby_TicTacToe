# frozen_string_literal: true

# Module to define helper methods that ask for values
module Messages
  def self.welcome_message
    puts 'Hello and welcome! This is a simple TicTacToe game!'
    puts 'Call a friend and play!'
  end

  def self.play_again?
    puts 'Play again? (y/n)'
    gets.chomp == 'y'
  end

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

  def finish_game(player)
    puts "\n\n\t Congratulations #{player.name}! You've won!\n\n"
    :finish
  end
end
