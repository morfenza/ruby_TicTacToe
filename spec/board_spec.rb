# frozen_string_literal: true

require './lib/board'

describe Board do
  describe '#insert_symbol' do
    subject(:board) { described_class.new }

    it 'correctly inserts symbol on given space' do
      symbol = 'X'
      space = 0
      expect { board.insert_symbol(symbol, space) }.to change { board.spaces[0] }.to('X')
    end
  end
end
