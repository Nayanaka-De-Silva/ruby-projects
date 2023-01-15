# frozen_string_literal: true

# Class to store the current board information
#
# @show_board: returns the current board as a string to display
class Board
  attr_accessor :squares

  attr_reader :display_line

  ROW_LEN = 3
  COL_LEN = 3

  def initialize(display_line = "-----------\n")
    @squares = Array.new(ROW_LEN) { |row| Array.new(ROW_LEN) { |col| (row * ROW_LEN) + (col + 1) } }
    @display_line = display_line
  end

  def show_board
    board_string = String.new('')

    Array.new(ROW_LEN) { |row| row }.each do |row|
      board_string << display_row(row + 1)
      board_string << @display_line if row < 2
    end

    board_string
  end

  def place_square(pos, symbol)
    # Mapping from position on square to row / col
    # puts "Rows: #{((pos - 1) / ROW_LEN).floor}"
    # puts "COL: #{((pos - 1) / COL_LEN)}"

    squares[get_row(pos)][get_col(pos)] = symbol
  end

  def transpose_board(board)
    Array.new(3) { |row| Array.new(3) { |col| board.squares[col][row] } }
  end

  def get_row(pos)
    ((pos - 1) / ROW_LEN).floor
  end

  def get_col(pos)
    (pos - 1) % COL_LEN
  end

  private

  # Display functions
  def display_row(row)
    raise 'ERROR (displayRow): Row parameter cannot be greater than 3 and less than 0' if row > 3 || row < 1

    Array.new(COL_LEN) { |col| display_square(row - 1, col) }.join('|') << "\n"
  end

  def display_square(row, col)
    " #{@squares[row][col]} "
  end
end
