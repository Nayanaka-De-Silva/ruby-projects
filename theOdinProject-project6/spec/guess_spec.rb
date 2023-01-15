# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/guess'

RSpec.describe Guess do
  subject(:guess) { described_class.new(%w[R B R Y]) }

  it "Guess is ['R', 'B', 'R', 'Y']" do
    expect(guess.row).to eq(%w[R B R Y])
  end

  it 'Reference a guess slot' do
    slot = 2
    expect(guess.row[slot]).to eq('R')
  end
end
