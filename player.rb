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

# подсчёт очков
end

class Dealer < Player
  def can_card?
    # нужно ли взять карту
  end
end