class Interface
  COMMANDS = {'1' => 'play'}.freeze

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

  # цикл игры

  def run
    puts "Ваш баланс(из текущего будет вычтена плата за игру)"
    puts @bank.player_balance
    loop do
      help
      if @cart.nil?
        @card = Deck.new
        @bank.diler_balance -= 10
        @bank.player_balance -= 10
      end
      puts "Ваше кол-во очков:"
      puts @card.player_score
      puts "Ваши карты:"
      puts @card.player_cards
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
      if @card.player_cards.count == 2
        @card.add_card
      else
        puts "У вас неподходящее кол-во карт"
      end
    when '2'
      if 22 > @card.player_score.to_i && @card.player_score.to_i > @card.diler_score.to_i
        puts "Вы выиграли"
        @bank.player_balance += 20
      elsif 22 > @card.diler_score.to_i && @card.diler_score.to_i > @card.player_score.to_i
        puts "Вы проиграли"
        @bank.diler_balance += 20
      elsif @card.player_score.to_i == @card.diler_score.to_i
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
    if @card.diler_score.to_i < 17
      @card.d_add_card
      puts "Дилер взял карту"
    else
      puts "Дилер пропустил ход"
    end
  end

  def help
    puts '1. Сделать ход'
  end
end