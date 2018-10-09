class Player
  attr_reader :name, :cards
  
  def initialize(name:)
    @name = name
    @cards = []
  end

  def discard(n)
    cards.delete_at(n)
  end
end