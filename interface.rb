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
    loop do
      help
      @game.give_cards
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
      @game.give_cards_in_the_game('player')
      puts "Вы взяли карту"
      @game.give_cards_in_the_game('dealer')
    when '2'
      puts "Игру выиграл #{@game.winner}"
      abort
    else
      puts "Вы пропустили ход"
      @game.give_cards_in_the_game('dealer')
    end
  end

  def help
    puts '1. Сделать ход'
  end
end
