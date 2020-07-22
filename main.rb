
# frozen_string_literal: true
# rubocop:disable all

require_relative 'bank'
require_relative 'player'
require_relative 'cart'


class Interface
  COMMANDS = {'1' => 'play'}.freeze

  def initialize
    @cart = nil
    @player = nil
    @bank = Bank.new
  end

  def run
    puts 'Добро пожаловать'
    puts 'Введите имя'
    name = gets.chomp
    @player = Player.new(name)
    puts "Добро пожаловать #{@player.name}"
    loop do
      help
      if @cart.nil?
        @cart = Cart.new
        @bank.diler_balance -= 10
        @bank.player_balance -= 10
      end
      puts "Ваше кол-во очков:"
      @cart.player_score
      puts 'Выберите пункт'
      choice = gets.chomp
      send(COMMANDS[choice])
    end
  end

  def play
    puts 'Выберите действие'
    puts '1. Добавить карту'
    puts '2. Открыть карты'
    puts '3. Пропустить'
    act = gets.chomp
    case act
    when '1'
      if @cart.player_carts.count == 2
        @cart.add_cart
      else
        puts "У вас неподходящее кол-во карт"
      end
    when '2'
      if 22 > @cart.player_score.to_i && @cart.player_score.to_i > @cart.diler_score.to_i
        puts "Вы выиграли"
        @bank.player_balance += 20
      elsif 22 > @cart.diler_score.to_i && @cart.diler_score.to_i > @cart.player_score.to_i
        puts "Вы проиграли"
        @bank.diler_balance += 20
      elsif @cart.player_score.to_i == @cart.diler_score.to_i
        puts "Ничья"
      end
      puts "Хотите начать новую игру?"
      flag = gets.chomp
      if flag == 'да'
        Interface.run
      else
        abort
      end
    else
      puts "Вы пропустили ход"
    end
    diler
  end

  def diler
    if @cart.diler_score.to_i < 17
      @cart.d_add_cart
    end
  end

  def help
    puts '1. Сделать ход'
  end
end

Interface.new.run
