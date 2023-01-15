# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/board'

RSpec.describe 'Board' do
  describe 'Basic Board Functionality Tests' do
    it 'Create a board' do
      board = Board.new
      expect(board).to be_an_instance_of(Board)
    end

    it 'Board is initialized correctly' do
      expected_board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

      actual_board = Board.new.squares

      expect(expected_board).to eq(actual_board)
    end

    board = Board.new
    pos = 4
    row = 1
    col = 0

    board.place_square(pos, 'X')
    it 'Set value to a square (position 4: row = 2, col = 0) to \'X\'' do
      expect(board.squares[row][col]).to eq('X')
    end
  end

  describe 'Board UI Tests' do
    it 'Display board' do
      board = Board.new
      expected_board = " 1 | 2 | 3 \n#{board.display_line} 4 | 5 | 6 \n#{board.display_line} 7 | 8 | 9 \n"

      expect(board.show_board).to eq(expected_board)
    end
  end
end
