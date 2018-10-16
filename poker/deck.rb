require "./poker/card.rb"

class Deck
  attr_reader :deck

  def initialize
    # Deckにshuffleメソッドがあるので、それを使ってあげると良さそう
    # @deck = ...
    # shuffle!
    @deck = Card::SUITS.map{ |s| Card::RANKS.map{ |r| Card.new(suit: s, rank: r) } }.flatten.shuffle!
  end

  # 破壊的なメソッドは語尾に!を付けたほうが良いです
  def shuffle
    deck.shuffle!
  end

end
