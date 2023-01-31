# frozen_string_literal: true

# Class defining a player and its attr
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
