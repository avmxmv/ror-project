class Bank
  attr_accessor :player_balance
  attr_accessor :diler_balance

  def initialize
    @diler_balance = 100
    @player_balance = 100
  end
end
