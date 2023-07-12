# frozen_string_literal: true

# Game class for main game logic
class Game
  attr_accessor :word

  def initialize
    @word = 'testing'
  end

  def random_word
    lines = File.readlines('words.txt')
    @word = lines.select { |line| line.chomp.length.between?(5, 12) }.sample.chomp
  end

  def play_game
    random_word
  end

  def menu_input
    loop do
      input = gets.chomp
      case input
      when '1'
        play_game
        break
      when '2'
        load_game
        break
      else
        puts 'Invalid input. Please enter 1 or 2.'
      end
    end
  end
end
