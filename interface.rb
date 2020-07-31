require_relative 'game'
require_relative 'card'
require_relative 'deck'
require_relative 'player'

class Interface
  attr_reader :game, :deck
  COMMANDS = { '1' => 'play' }.freeze

  def initialize
    @game = Game.new(introduce)
  end

  def introduce
    puts 'Добро пожаловать'
    puts 'Введите имя'
    name = gets.chomp
    puts "Добро пожаловать #{name}"
    name
  end

  def run
    @game.new_game
    @game.give_cards
    loop do
      puts "Ваши очки: #{@game.player.scoring}"
      puts "Ваши карты:"
      @game.check_cards(@game.player)
      puts "Очки дилера: #{@game.dealer.scoring}"
      help
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
    if act == '1'
      @game.give_cards_in_the_game('player')
      puts "Вы взяли карту"
      flag(@game.give_cards_in_the_game('dealer'))
    elsif act == '2'
      puts "Игру выиграл:"
      puts @game.winner.name
      puts "Ваши карты:"
      @game.check_cards(@game.player)
      puts "Карты дилера:"
      @game.check_cards(@game.dealer)
      abort
    else
      puts "Вы пропустили ход"
      @game.give_cards_in_the_game('dealer')
      flag(@game.give_cards_in_the_game('dealer'))
    end
  end

  def flag(flag)
    if flag.nil?
      puts "Дилер пропустил ход"
    else
      puts "Дилер взял карту"
    end
  end

  def help
    puts '1. Сделать ход'
  end
end
