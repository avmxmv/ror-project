
# frozen_string_literal: true
# rubocop:disable all

require_relative 'bank'
require_relative 'player'
require_relative 'cart'


class Interface
  COMMANDS = {
      '1' => 'create_player', '2' => 'player_score', '3' => 'play', '4' => 'add_station',
      '5' => 'delete_station', '6' => 'new_train_speed', '7' => 'look_train_speed', '8' => 'stop_train',
      '9' => 'route_for_train', '10' => 'main_forward', '11' => 'main_backward', '12' => 'print_station',
      '13' => 'add_vagon', '14' => 'del_vagon', '15' => 'occupy_volume'
  }.freeze

  def initialize
    @cart = nil
    @player = nil
    @bank = Bank.new
  end

  def run
    loop do
      puts 'Добро пожаловать'
      help
      puts 'Выберите пункт'
      choice = gets.chomp
      send(COMMANDS[choice])
    end
  end

  def create_player
    puts 'Введите имя'
    name = gets.chomp
    @player = Player.new(name)
    puts "Добро пожаловать #{@player.name}"
  end

  def player_score
    if @cart.nil?
      @cart = Cart.new
      @bank.diler_balance -= 10
      @bank.player_balance -= 10
    end
    @cart.player_score
  end

  def play
    puts 'Выберите действие'
    puts '1. Добавить карту'
    puts '2. Открыть карты'
    puts '3. Пропустить'
    act = gets.chomp
    case act
    when 1
      if @cart.player_carts.count == 2
        @cart.add_cart
      else
        puts "У вас неподходящее кол-во карт"
      end
    when 2
      if 21 >= @cart.player_score && @cart.player_score > @cart.diler_score
        puts "Вы выиграли"
      elsif 21 >= @cart.diler_score && @cart.diler_score > @cart.player_score
        puts "Вы проиграли"
      elsif @cart.diler_score == @cart.player_score
        puts "Ничья"
      end
    else
      puts "Вы пропустили ход"
    end
  end

  def diler
    if diler_score < 17
      @cart.d_add_cart
    end
  end

  def help
    puts '1. Создать игрока'
    puts '2. Посмотреть сумму очков'
    puts '3. Сделать ход'
  end
end

Interface.new.run
