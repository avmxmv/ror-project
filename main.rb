
# frozen_string_literal: true
# rubocop:disable all

require_relative 'bank'
require_relative 'player'
require_relative 'cart'
require_relative 'station'


class Interface
  # COMMANDS = {
  #     '1' => 'create_station', '2' => 'create_train', '3' => 'create_route', '4' => 'add_station',
  #     '5' => 'delete_station', '6' => 'new_train_speed', '7' => 'look_train_speed', '8' => 'stop_train',
  #     '9' => 'route_for_train', '10' => 'main_forward', '11' => 'main_backward', '12' => 'print_station',
  #     '13' => 'add_vagon', '14' => 'del_vagon', '15' => 'occupy_volume'
  # }.freeze

  def run
    loop do
      help
    end
  end

  def player_carts
    Cart.player_carts
  end

  def diler_carts
    Cart.diler_carts
  end

  def help
    puts 'Добро пожаловать'

  end
end

Interface.new.run
