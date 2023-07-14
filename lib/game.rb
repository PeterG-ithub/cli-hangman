# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
# Game class for main game logic
class Game
  attr_accessor :word

  def initialize
    @word = 'testing'
    @placeholder = []
    @guesses = []
    @incorrect_guesses = []
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
    remaining_guess(10 - @incorrect_guesses.count)
    puts @placeholder.join(' ').bold.blue
    puts ''
  end

  def handle_guess(player_guess)
    if @word.split('').any?(player_guess)
      @word.split('').each_with_index do |char, idx|
        @placeholder[idx] = player_guess if char == player_guess
      end
      @guesses << player_guess
    else
      @guesses << player_guess
      @incorrect_guesses << player_guess
      wrong_guess(@incorrect_guesses)
    end
  end

  def start_round
    puts @word
    print_placeholder
    loop do
      break if game_over?

      handle_guess(guess_input)
      print_placeholder
    end
  end

  def guess_input
    print 'Please enter a character: '
    guess = gets.chomp
    puts ''
    until correct_guess?(guess)
      invalid_guess
      guess = gets.chomp
    end
    guess.downcase
  end

  def correct_guess?(guess)
    if guess.length == 1
      true if guess.count('a-zA-Z').positive? && !guess_already?(guess)
    else
      false
    end
  end

  def guess_already?(guess)
    if @guesses.any?(guess)
      puts 'You already guess that.'
      print_placeholder
      true
    else
      false
    end
  end

  def game_over?
    if @word == @placeholder.join('')
      winner
      true
    elsif @guesses.count == 10
      loser
      true
    else
      false
    end
  end
end

# rubocop:enable Metrics/MethodLength
