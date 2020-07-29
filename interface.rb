class Interface
  attr_reader :game
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

  def new_game
    deck = Deck.new
  end

  def run
    new_game
    loop do
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
    case act
    when '1'
      give_cards_in_the_game(player)
      puts "Вы взяли карту ход"
    when '2'
      puts "Игру выиграл #{@game.winner}"
    else
      puts "Вы пропустили ход"
    end
    Diler.can_card
  end

  def help
    puts '1. Сделать ход'
  end
end
