class Player
  attr_accessor :name
  attr_accessor :money

  def initialize(name)
    @name = name
    @money = 100
  end
end
