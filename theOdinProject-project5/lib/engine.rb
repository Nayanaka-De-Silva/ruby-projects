# frozen_string_literal: true

require_relative 'player'
require_relative 'console'
require_relative 'validation'
require_relative 'board'

# This class controls the flow of the game. It uses the other classes to construct the game
class Engine
  # Instance parameters
  attr_accessor :players, :board, :turns

  # constants
  SYM_1 = 'X'
  SYM_2 = 'O'
  MAX_ROW = 3
  MAX_COL = 3
  MAX_TURNS = MAX_ROW * MAX_COL
  DEBUG = false

  include Console
  include Validation

  def initialize
    # When the engine is called, the game loop is for a single round is supposed to start
    @turns = 0
  end

  def check_winner(board, symbol)
    # The different ways to win:
    check_winner_horizontal(board, symbol) ||
      check_winner_vertical(board, symbol) ||
      check_winner_diagonal_one(board, symbol) ||
      check_winner_diagonal_two(board, symbol)
  end

  # ----Game Start Functions----
  def game_start
    welcome
    # To start the game:
    # 1. create the players
    player_x_name = get_player_name('X')
    player_y_name = get_player_name('O')

    load_players(player_x_name, player_y_name)

    @board = Board.new

    game_loop
  end

  def game_loop
    game_over = false
    @turns = 0
    current_player = 'X'
    until game_over || @turns >= 9

      if DEBUG
        puts "game_over: #{game_over}"
        puts "current_player: #{current_player}"
        puts "board: #{board}"
      end

      puts board.show_board
      input = get_player_input(players[current_player])
      valid_move = check_all(input, board)

      if valid_move.negative?
        board.place_square(input.to_i, players[current_player].symbol)
        game_over = check_winner(board, 'X')
        @turns += 1 unless game_over
        puts "#{players[current_player].name} wins!" if game_over
        current_player = current_player == 'X' ? 'O' : 'X'
      else
        validation_error(valid_move)
      end
    end

    puts "It's a tie!" if @turns >= 9
  end

  def load_players(player_x_name = '', player_o_name = '')
    # 1. Create Player 1 (X)
    player_x = !player_x_name.empty? ? Player.new(player_x_name, SYM_1) : Player.new(name_prompt('X'), SYM_1)

    # 2. Create Player 2 (O)
    player_o = !player_o_name.empty? ? Player.new(player_o_name, SYM_2) : Player.new(name_prompt('O'), SYM_2)

    @players = Hash['X' => player_x, 'O' => player_o]
  end

  def name_prompt(symbol)
    puts "Please Enter Player #{symbol}'s Name: "
    gets.chomp
  end

  private

  # ----Check winner functions-----
  # Each function checks for a specific win scenario
  def check_winner_horizontal(board, symbol)
    winner = false
    board.squares.each { |row| winner = true if row.all? { |col| col == symbol } }
    winner
  end

  def check_winner_vertical(board, symbol)
    winner = false
    board.transpose_board(board).each { |row| winner = true if row.all? { |col| col == symbol } }
    winner
  end

  def check_winner_diagonal_one(board, symbol)
    winner = false
    winner = true if board.squares[0][2] == symbol && board.squares[1][1] == symbol && board.squares[2][0] == symbol
    winner
  end

  def check_winner_diagonal_two(board, symbol)
    winner = false
    winner = true if board.squares[0][0] == symbol && board.squares[1][1] == symbol && board.squares[2][2] == symbol
    winner
  end
end
