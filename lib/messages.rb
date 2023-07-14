# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
def main_menu
  banner
  intro
  play_load
end

def banner
  puts <<-'EOF'

  $$\
  $$ |
  $$$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\  $$$$$$\$$$$\   $$$$$$\  $$$$$$$\
  $$  __$$\  \____$$\ $$  __$$\ $$  __$$\ $$  _$$  _$$\  \____$$\ $$  __$$\
  $$ |  $$ | $$$$$$$ |$$ |  $$ |$$ /  $$ |$$ / $$ / $$ | $$$$$$$ |$$ |  $$ |
  $$ |  $$ |$$  __$$ |$$ |  $$ |$$ |  $$ |$$ | $$ | $$ |$$  __$$ |$$ |  $$ |
  $$ |  $$ |\$$$$$$$ |$$ |  $$ |\$$$$$$$ |$$ | $$ | $$ |\$$$$$$$ |$$ |  $$ |
  \__|  \__| \_______|\__|  \__| \____$$ |\__| \__| \__| \_______|\__|  \__|
                                $$\   $$ |
                                \$$$$$$  |
                                 \______/
  EOF
end

def intro
  puts ''
  puts ''
  puts 'Welcome to Hangman'.bold.underline
  puts ''
end

def play_load
  puts "Enter: #{'1'.green.bold} to #{'Play'.green.bold}"
  puts "       #{'2'.yellow.bold} to #{'Load'.yellow.bold}"
end

def wrong_guess(guesses)
  puts 'Wrong guess sorry'
  puts "Your incorrect guesses {#{guesses.join(', ').bold.red}}"
end

def remaining_guess(num)
  puts "You have #{num} guesses remaining."
end

def invalid_guess
  puts 'Invalid guess.'
  print 'Please enter a character: '
end

def winner
  puts 'Congratulations! You won!'
  puts 'Goodbye!'
end

def loser
  puts 'Unfortunately, You lost!'
  puts 'Goodbye!'
end
# rubocop:enable Metrics/MethodLength
