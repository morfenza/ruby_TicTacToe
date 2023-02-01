# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'messages_module'

# Class defining the game logic
class Game
  include Messages

  attr_reader :player1, :player2

  def initialize
    @player1 = Player.new(ask_name(1), ask_symbol)
    @player2 = Player.new(ask_name(2), ask_symbol)
    @board = Board.new
    puts @board.display_board
  end

  # Single round is played
  def play_round(player)
    @board.insert_symbol(player.symbol, ask_space(player) - 1)
    puts @board.display_board
    return finish_game(player) if check_victory.eql?(player.symbol)
  end

  # Generic victory check
  def check_victory
    Board::WINNING_LINES.each do |line|
      if @board.spaces[line[0]] == @board.spaces[line[1]] &&
         @board.spaces[line[0]] == @board.spaces[line[2]]
        return @board.spaces[line[0]]
      end
    end
  end
end
