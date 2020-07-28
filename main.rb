# frozen_string_literal: true
# rubocop:disable all

require_relative 'game'
require_relative 'card'
require_relative 'deck'
require_relative 'interface'
require_relative 'player'

Interface.new.run
