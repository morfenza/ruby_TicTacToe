# frozen_string_literal: true

require './lib/game'
require './lib/board'

describe Game do
  describe '#check_victory' do
    let(:board) { double('board', spaces: (1..9).to_a, display_board: nil) }
    let(:player1) { double('ian', name: 'Ian', symbol: 'X') }
    let(:player2) { double('gab', name: 'Gab', symbol: 'O') }
    subject(:winning_game) { described_class.new(player1, player2, board) }

    context 'there is a winning line' do
      before do
        allow($stdout).to receive(:write)
        winning_game.instance_variable_get(:@board).spaces[0] = player1.symbol
        winning_game.instance_variable_get(:@board).spaces[1] = player1.symbol
        winning_game.instance_variable_get(:@board).spaces[2] = player1.symbol
      end

      it 'returns the current player symbol' do
        player1_symbol = player1.symbol
        result = winning_game.check_victory
        expect(result).to eq(player1_symbol)
      end
    end

    context 'there is no winning line' do
      before do
        allow($stdout).to receive(:write)
      end

      it 'does not return player 1 symbol' do
        result = winning_game.check_victory
        expect(result).not_to eq(player1.symbol)
      end

      it 'does not return player 2 symbol' do
        result = winning_game.check_victory
        expect(result).not_to eq(player2.symbol)
      end
    end
  end

  describe '#play_round' do
    let(:board) { instance_double(Board, spaces: (1..9).to_a) }
    let(:player1) { double('ian', name: 'Ian', symbol: 'X') }
    let(:player2) { double('gab', name: 'Gab', symbol: 'O') }
    subject(:game) { described_class.new(player1, player2, board) }

    before do
      allow($stdout).to receive(:write)
      allow(board).to receive(:display_board)
      allow(game).to receive(:ask_space).and_return(1, 2, 3)
    end

    it 'correctly inserts symbol' do
      space = 0
      expect(board).to receive(:insert_symbol).with(player1.symbol, space)
      game.play_round(player1)
    end

    it 'finishes the game' do
      allow(board).to receive(:insert_symbol)
      game.instance_variable_get(:@board).spaces[0] = player1.symbol
      game.instance_variable_get(:@board).spaces[1] = player1.symbol
      game.instance_variable_get(:@board).spaces[2] = player1.symbol
      expect(game.play_round(player1)).to eq(:finish)
    end
  end
end
