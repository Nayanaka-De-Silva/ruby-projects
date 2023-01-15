# frozen_string_literal: true

# Player Class
# The Player class helps to manage all the player information that is required to play the game.
# Parameters:
# 	@name: The name of the player
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
