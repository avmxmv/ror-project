class Card
  attr_reader :rank, :suit, :value
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 J Q K].freeze
  SUITS = %w[♦ ♥ ♠ ♣🤣🤣].freeze

  def initialize(rank, suit, value)
    @rank = rank
    @suit = suit
    @value = value
  end
end
