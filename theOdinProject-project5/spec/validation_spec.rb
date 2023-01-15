# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/validation'
require_relative '../lib/board'

RSpec.describe 'Validation' do
  include Validation
  describe 'Player cannot play an occupied tile' do
    board = Board.new

    it 'Play a tile that is not occupied' do
      expect(check_if_tile_occupied(4, board)).to eq(true)
    end

    it 'Play a tile that is occupied' do
      board.place_square(4, 'X')
      expect(check_if_tile_occupied(4, board)).to eq(false)
    end
  end

  describe 'Player cannot play an out-of-bound tile' do
    it 'Player played -1' do
      expect(check_if_not_out_of_bounds(-1)).to eq(false)
    end

    it 'Player played 3' do
      expect(check_if_not_out_of_bounds(3)).to eq(true)
    end
  end

  describe 'Player cannot play an alphanumeric character' do
    it 'Player Played a' do
      expect(check_if_not_alphanumeric('a')).to eq(false)
    end
    it 'Player Played belll' do
      expect(check_if_not_alphanumeric('a')).to eq(false)
    end
    it 'Player Played One' do
      expect(check_if_not_alphanumeric('a')).to eq(false)
    end
    it 'Player Played 2' do
      expect(check_if_not_alphanumeric('2')).to eq(true)
    end
  end
end
