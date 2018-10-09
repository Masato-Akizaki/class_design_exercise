class Card
  SUITS = %w{S H C D}
  RANKS = %w{2 3 4 5 6 7 8 9 10 J Q K A}
  attr_reader :suit, :rank, :rank_power
  
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