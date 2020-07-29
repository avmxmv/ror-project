class Player
  attr_reader :name, :cards, :money

  DEFAULT_MONEY = 100

  def initialize(name)
    @name = name
    @cards = []
    @money = DEFAULT_MONEY
  end

  def take_card(card)
    @cards << card
  end

  def scoring
    summ = 0
    @cards.each do |card|
      summ += card.value
    end
    summ
  end
end

class Dealer < Player
  def can_card
    if scoring < 17 && @cards.count == 2
      Game.give_cards_in_the_game(dealer)
    end
  end
end
