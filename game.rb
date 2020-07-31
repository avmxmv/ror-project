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

  def check_cards(user)
    user.cards.each do |card|
      puts card.rank + card.suit
    end
  end

  def make_bet; end

  def winner
    if 21 < @player.scoring && 21 < @dealer.scoring
      nil
    elsif 22 > @player.scoring && @player.scoring > @dealer.scoring
      @player
    elsif 22 > @dealer.scoring && @dealer.scoring > @player.scoring
      @dealer
    elsif @player.scoring == @dealer.scoring
      nil
    end
  end

  def give_cards_in_the_game(user)
    if user == 'player'
      @player.take_card(@deck.give_card)
    else
      if @dealer.scoring < 17 && @dealer.cards.count == 2
        @dealer.take_card(@deck.give_card)
      else
        nil
      end
    end
  end
end
