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
    @game.make_bet
    loop do
      puts "Ваши очки: #{@game.player.scoring}"
      puts "Ваши карты:"
      @game.check_cards(@game.player, 1)
      puts "Ваш баланс:"
      puts @game.player.money
      puts "Очки дилера: #{@game.dealer.scoring}"
      puts "Карты дилера:"
      @game.check_cards(@game.player, 2)
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
      if @game.give_cards_in_the_game('player')
        puts "Вы взяли карту"
      else
        puts "Вы не можете взять карту"
      end
      flag(@game.give_cards_in_the_game('dealer'))
    elsif act == '2'
      puts "Игру выиграл:"
      puts @game.winner&.name
      puts "Ваши карты:"
      @game.check_cards(@game.player, 1)
      puts "Карты дилера:"
      @game.check_cards(@game.dealer, 1)
      puts "Ваш баланс:"
      puts @game.player.money
      puts "Вы хотите начать новую игру?"
      answer = gets.chomp
      if answer == 'да'
        Interface.run
      else
        abort
      end
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
