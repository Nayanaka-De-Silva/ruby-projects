# frozen_string_literal: true

# This class acts as a prototype for all the guesses
class Guess
  attr_accessor :row

  def initialize(row = [])
    @row = row
  end
end
