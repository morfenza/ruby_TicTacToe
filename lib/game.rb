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
    check_victory(board, player)
  end

  def check_victory(board, player); end
end

g = Game.new
g.play_round(g.board, g.player2)
g.play_round(g.board, g.player2)
