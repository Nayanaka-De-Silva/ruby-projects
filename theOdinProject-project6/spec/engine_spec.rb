# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/guess'
require_relative '../lib/engine'
require_relative '../lib/board'

RSpec.describe Engine do
  subject(:engine) { described_class.new }

  it 'Check if a new board is created' do
    expect(engine.board).to be_instance_of(Board)
  end

  it 'Generate a new correct answer' do
    expect(engine.answer).to be_instance_of(Guess)
  end

  it 'Check if a correct guess matches an answer' do
    test_engine = described_class.new
    answer = test_engine.answer
    row = 3
    test_engine.board.load_guess(answer, row)
    expect(test_engine.winner?(row)).to eq(true)
  end
end
