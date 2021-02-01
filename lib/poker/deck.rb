require "poker/card.rb"

class Deck
  attr_reader :deck
  
  def initialize
    @deck = Card::SUITS.map{ |s| Card::RANKS.map{ |r| Card.new(suit: s, rank: r) } }.flatten
    shuffle!
  end

  def shuffle!
    deck.shuffle!
  end

end