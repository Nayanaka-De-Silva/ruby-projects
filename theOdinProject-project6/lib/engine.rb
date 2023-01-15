# frozen_string_literal: true

# This class holds the logic for the game
class Engine
  attr_accessor :board

  attr_reader   :answer

  POSSIBLE_COLOR = %w[R G B Y].freeze

  def initialize(answer = nil)
    @board = Board.new
    @answer = !answer ? generate_answer : answer
  end

  def winner?(row)
    @board.compare_guess(@answer, row)
  end

  private

  def generate_answer
    random = Random.new
    answer_array = Array.new(4) { POSSIBLE_COLOR[random.rand(0...4)] }
    @answer = Guess.new(answer_array)
  end
end
