# frozen_string_literal: true

# Class defining a TicTacToe board (# -> 1..9)
class Board
  attr_accessor :spaces

  WINNING_LINES = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # Horizontal Lines
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # Vertical Lines
    [0, 4, 8], [2, 4, 6]             # Diagonial Lines
  ].freeze

  def initialize
    self.spaces = (1..9).to_a
  end

  def insert_symbol(symbol, space)
    spaces[space] = symbol
  end

  def show_board
    <<~BOARD

      #{@spaces[0]} | #{@spaces[1]} | #{@spaces[2]}
      --+---+--
      #{@spaces[3]} | #{@spaces[4]} | #{@spaces[5]}
      --+---+--
      #{@spaces[6]} | #{@spaces[7]} | #{@spaces[8]}

    BOARD
  end
end
