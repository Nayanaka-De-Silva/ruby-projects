# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/engine'
require_relative '../lib/board'

RSpec.describe 'Engine' do
  describe 'Basic Engine Tests' do
    it 'Create a engine' do
      expect(Engine.new).to be_an_instance_of(Engine)
    end

    it 'Load a board to an engine' do
      engine = Engine.new
      engine.board = Board.new

      expect(engine.board).to be_an_instance_of(Board)
    end

    it 'Check Winner' do
      board = Board.new
      board.squares[0][0..2] = 'X'

      engine = Engine.new
      engine.board = board

      expect(engine.check_winner(engine.board, 'X')).to eq(true)
    end
  end

  describe 'Load Players "Andy" and "John"' do
    engine = Engine.new
    engine.load_players('Andy', 'John')

    it 'Test whether player "Andy" was loaded' do
      expect(engine.players['X'].name).to eq('Andy')
    end

    it 'Test whether player "John" was loaded' do
      expect(engine.players['O'].name).to eq('John')
    end
  end

  describe 'Check Winner Scenarios' do
    board = Board.new
    engine = Engine.new
    symbol = 'X'
    it 'Negative Test 1' do
      expect(engine.check_winner(board, symbol)).to eq(false)
    end

    it 'Diagonals 1' do
      board.place_square(1, symbol)
      board.place_square(5, symbol)
      board.place_square(9, symbol)

      expect(engine.check_winner(board, symbol)).to eq(true)
    end

    it 'Diagonals 2' do
      board.place_square(3, symbol)
      board.place_square(5, symbol)
      board.place_square(7, symbol)

      expect(engine.check_winner(board, symbol)).to eq(true)
    end

    it 'Vertical 1' do
      board.place_square(1, symbol)
      board.place_square(4, symbol)
      board.place_square(7, symbol)

      expect(engine.check_winner(board, symbol)).to eq(true)
    end

    it 'Vertical 2' do
      board.place_square(2, symbol)
      board.place_square(5, symbol)
      board.place_square(8, symbol)

      expect(engine.check_winner(board, symbol)).to eq(true)
    end

    it 'Vertical 3' do
      board.place_square(3, symbol)
      board.place_square(6, symbol)
      board.place_square(9, symbol)

      expect(engine.check_winner(board, symbol)).to eq(true)
    end
  end
end
