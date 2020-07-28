require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = generate_cards
  end

  def give_card
    @cards.pop
  end

  private

  def check_value(rank)
    case rank
    when 'A'
      11
    when 'J', 'Q', 'K'
      10
    else
      rank.to_i
    end
  end

  def generate_cards
    cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        cards << Card.new(rank, suit, check_value(rank))
      end
    end
    cards.shuffle
  end
end
