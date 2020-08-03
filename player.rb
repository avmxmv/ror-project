require_relative 'game'
require_relative 'card'
require_relative 'deck'
require_relative 'interface'

class Player
  attr_reader :name
  attr_accessor :money, :cards

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
    kol_a = 0
    @cards.each do |card|
      summ += card.value
      if card.value == 11
        kol_a += 1
      end
    end
    while summ > 21 && kol_a != 0
      summ -= 10
      kol_a -= 1
    end
    summ
  end
end
