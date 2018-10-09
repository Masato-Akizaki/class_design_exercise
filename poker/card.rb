class Card
  attr_reader :suit, :rank
  
  def initialize(suit:, rank:)
    @suit = suit
    @rank = rank
  end

  def notation
    "#{@rank}#{@suit}"
  end

  def has_same_suit(card)
    suit == card.suit
  end

  def has_same_rank(card)
    rank == card.rank
  end

end