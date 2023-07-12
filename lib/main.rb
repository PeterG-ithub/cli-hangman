# frozen_string_literal: true

require_relative 'string'
require_relative 'messages'
require_relative 'game'

main_menu
game = Game.new
game.menu_input
puts game.word
