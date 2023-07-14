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

def wrong_guess
  puts 'Wrong guess sorry'
end
# rubocop:enable Metrics/MethodLength
