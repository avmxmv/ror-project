class Game
  def initialize(name)
    @player = Player.new(name)
    @dealer = Player.new("Dealer")
  end

  def new_game
    @player.cards = []
    @dealer.cards = []
    @deck = Deck.new
  end

  def give_cards
    @dealer.take_card(@deck.give_card)
    @player.take_card(@deck.give_card)
    @dealer.take_card(@deck.give_card)
    @player.take_card(@deck.give_card)
  end

  def make_bet

  end

# определить победителя
# отдаватние денег победитель
# выдача карт в течение игры
end