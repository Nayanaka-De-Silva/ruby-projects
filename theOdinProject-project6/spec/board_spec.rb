# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/board'

RSpec.describe Board do
  subject(:board) { described_class.new }

  it 'Create a new board instance' do
    expect(board.guesses).to be_instance_of(Array)
  end

  it 'Load a guess into a guess slot' do
    guess = Guess.new(%w[R G B R])
    row = 3
    board.load_guess(guess, row)
    expect(board.guesses[row]).to be(guess)
  end

  it 'Compare a correct guess' do
    test_guess = Guess.new(%w[R G B R])
    row = 3
    board.load_guess(test_guess, row)
    expect(board.compare_guess(test_guess, row)).to eq(true)
  end
end
