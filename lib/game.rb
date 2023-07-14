# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
# Game class for main game logic
class Game
  attr_accessor :word

  def initialize
    @word = 'testing'
    @placeholder = []
  end

  def random_word
    lines = File.readlines('words.txt')
    @word = lines.select { |line| line.chomp.length.between?(5, 12) }.sample.chomp
  end

  def play_game
    system('clear')
    random_word
    create_placeholder
    start_round
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

  def create_placeholder
    word.length.times { @placeholder << '_' }
  end

  def print_placeholder
    puts @placeholder.join(' ').bold.blue
  end

  def handle_guess(player_guess)
    if @word.split('').any?(player_guess)
      @word.split('').each_with_index do |char, idx|
        @placeholder[idx] = player_guess if char == player_guess
      end
    else
      wrong_guess
    end
  end

  def start_round
    print_placeholder
    handle_guess
  end
end

# rubocop:enable Metrics/MethodLength
