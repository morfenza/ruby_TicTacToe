# frozen_string_literal: true

require './lib/player'
require './lib/board'
require './lib/game'
require './lib/messages_module'

# In this file we'll run the game loop
Messages.welcome_message

loop do
  game = Game.new

  loop do
    break if !game.play_round(game.player1).nil? || !game.play_round(game.player2).nil?
  end

  break unless Messages.play_again?
end
