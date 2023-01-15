# frozen_string_literal: true

# This class controls the user interface of the game. This is also a class that acts as a wrapper for most of the game
module Console
  def welcome
    puts 'Welcome to Tic Tac Toe!'
  end

  def get_player_name(symbol)
    puts "Player #{symbol}, please enter your name: "
    gets.chomp
  end

  def get_player_input(player)
    puts "It's your turn #{player.name}. Which tile would you like to play? : "
    gets.chomp
  end

  def validation_error(error)
    case error
    when 0
      puts 'ERROR: Selected tile is occupied. Please try again'
    when 1
      puts 'ERROR: Selected tile is out-of-bounds. Please try again.'
    when 2
      puts 'ERROR: Invalid Input. Please try again.'
    end
  end
end
