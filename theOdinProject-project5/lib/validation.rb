# frozen_string_literal: true

# This module controls the validation rules of the game
module Validation
  def check_if_tile_occupied(tile, board)
    !(board.squares[board.get_row(tile)][board.get_col(tile)] == 'X' ||
      board.squares[board.get_row(tile)][board.get_col(tile)] == 'O')
  end

  def check_if_not_out_of_bounds(tile)
    tile <= 9 && tile >= 1
  end

  def check_if_not_alphanumeric(input)
    input.match?('^[0-9]*$')
  end

  # -----------------------------------
  def check_all(tile, board)
    return 2 unless check_if_not_alphanumeric(tile)
    return 0 unless check_if_tile_occupied(tile.to_i, board)
    return 1 unless check_if_not_out_of_bounds(tile.to_i)

    -1
  end
end
