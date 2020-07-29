class Interface
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

  end

  def help
    puts '1. Сделать ход'
  end
end
