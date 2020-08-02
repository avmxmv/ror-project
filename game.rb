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

  def winner
    if 21 < @player.scoring && 21 < @dealer.scoring
      @player.money += 10
      @dealer.money += 10
      nil
    elsif 22 > @player.scoring && @player.scoring > @dealer.scoring
      @player.money += 20
      @player
    elsif 22 > @dealer.scoring && @dealer.scoring > @player.scoring
      @dealer.money += 20
      @dealer
    elsif 22 > @player.scoring && @dealer.scoring > 21
      @player.money += 20
      @player
    elsif 22 > @dealer.scoring && @player.scoring > 21
      @dealer.money += 20
      @dealer
    elsif @player.scoring == @dealer.scoring
      @player.money += 10
      @dealer.money += 10
      nil
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
