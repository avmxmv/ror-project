require_relative 'card'
require_relative 'deck'
require_relative 'interface'
require_relative 'player'

class Game
  attr_reader :dealer, :player

  def initialize(name)
    @player = Player.new(name)
    @dealer = Player.new('Dealer')
    new_game
  end

  def new_game
    @deck = Deck.new
  end

  def give_cards
    @dealer.take_card(@deck.give_card)
    @player.take_card(@deck.give_card)
    @dealer.take_card(@deck.give_card)
    @player.take_card(@deck.give_card)
  end

  def check_cards(user, index)
    if index == 1
      user.cards.each do |card|
        puts card.rank + card.suit
      end
    else
      user.cards.each do |i|
        puts '*'
      end
    end
  end

  def make_bet;
    @player.money -= 10
    @dealer.money -= 10
  end

  def gain(user)
    if user
      user.money += 20
    else
      @player.money += 10
      @dealer.money += 10
    end
  end

  def clear
    @dealer.cards = []
    @player.cards = []
  end

  def winner
    if (@player.scoring > 21 && @dealer.scoring > 21) || @player.scoring == @dealer.scoring # Проверяем не вышли ли оба игрока за грань, ну или их очки равны (то ничья)
      nil
    elsif @player.scoring > 21 # Если у игрока очков больше 21, то выиграл дилер
      @dealer
    elsif @dealer.scoring > 21 # Если у дилера очков больше 21, то выиграл игрок
      @player
    else
      [@player, @dealer].max_by(&:scoring) # Иначе возвращаем пользователя у кого больше всего scoring
    end
  end

  def give_cards_in_the_game(user)
    if user == 'player' && @player.cards.count == 2
      @player.take_card(@deck.give_card)
    elsif user != 'player'
      if @dealer.scoring < 17 && @dealer.cards.count == 2 && @dealer.cards.count == 2
        @dealer.take_card(@deck.give_card)
      else
        nil
      end
    else
      nil
    end
  end
end
