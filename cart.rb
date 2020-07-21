class Cart
  attr_accessor :player_carts
  attr_accessor :diler_carts

  CARTS = %w[T+ 5+ 6+ 7+ 8+ 9+ 10+ V+ D+ К+ T<3 5<3 6<3 7<3 8<3 9<3 10<3 V<3 D<3 К<3 T^ 5^ 6^ 7^ 8^ 9^ 10^ V^ D^ К^ T<> 5<> 6<> 7<> 8<> 9<> 10<> V<> D<> К<>]

  def initialize
    @player_carts = [CARTS.sample, CARTS.sample]
    @diler_carts = [CARTS.sample, CARTS.sample]
  end

  def player_score
    summ = 0
    @player_carts.each do |el|
      summ += CARTS.index(el) % 10 + 1
    end
    puts summ
  end

  def diler_score
    summ = 0
    @diler_carts.each do |el|
      summ += CARTS.index(el) % 10 + 1
    end
    puts summ
  end

  def add_cart
    @player_carts << CARTS.sample
  end

  def d_add_cart
    @diler_carts << CARTS.sample
  end
end