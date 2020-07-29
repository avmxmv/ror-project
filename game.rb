class Game
  def initialize(name)
    @player = Player.new(name)
    @dealer = Player.new('Dealer')
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

  def make_bet; end

  def winner
    if 22 > @player.scoring &&@player.scoring > @dealer.scoring
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
      @dealer.take_card(@deck.give_card)
    end
  end
end
