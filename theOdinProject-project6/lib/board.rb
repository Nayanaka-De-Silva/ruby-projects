# frozen_string_literal: true

require_relative 'guess'

# Board: Class to handle the logic for each board
class Board
  attr_accessor :guesses

  def initialize
    @guesses = Array.new(12) { Guess.new(Array.new(4) { '-' }) }
  end

  def load_guess(guess, row)
    @guesses[row] = guess
  end

  def compare_guess(input_guess, row)
    @guesses[row] == input_guess
  end
end
