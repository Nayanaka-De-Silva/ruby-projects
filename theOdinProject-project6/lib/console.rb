# frozen_string_literal: true

# Class to hold the console commands
class Console
  attr_reader :player

  def initialize(player: false)
    @player = player unless player
  end

  def welcome
    puts 'Welcome to Mastermind!'
  end

  def insert_name
    puts 'Please enter your name: '
    @player = gets.chomp.to_s
  end

  def player_input
    puts "#{@player}, make your guess: "
    gets.chomp.to_s
  end
end
