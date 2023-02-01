# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'messages_module'

# Class defining the game logic
class Game
  include Messages

  attr_reader :player1, :player2, :board

  def initialize
    @player1 = Player.new(ask_name(1), ask_symbol)
    @player2 = Player.new(ask_name(2), ask_symbol)
    @board = Board.new
  end

  def play_round(board, player)
    board.insert_symbol(player.symbol, ask_space(player) - 1)
    puts board.display_board
    return finish_game(player) if check_victory(board).eql?(player.symbol)
  end

  def check_victory(board)
    Board::WINNING_LINES.each do |line|
      if board.spaces[line[0]] == board.spaces[line[1]] &&
         board.spaces[line[0]] == board.spaces[line[2]]
        return board.spaces[line[0]]
      end
    end
  end
end
