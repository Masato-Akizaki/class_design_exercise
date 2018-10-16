class Card
  SUITS = %w{ S H C D }
  RANKS = %w{ 2 3 4 5 6 7 8 9 10 J Q K A }
  attr_reader :suit, :rank

  def initialize(suit:, rank:)
    @suit = suit
    @rank = rank
  end

  def notation
    # インスタンス変数を直接参照するのではなく、attr_readerの使ったほうが良さそう
    "#{@suit}#{@rank}"
  end

  def has_same_suit?(other)
    suit == other.suit
  end

  def has_same_rank?(other)
    rank == other.rank
  end
end
