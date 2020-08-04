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
    total = @cards.map(&:value).sum
    @cards.select(&:ace?).each do |card|
      total > 21 ? total -= 10 : break
    end
    total
  end
end
