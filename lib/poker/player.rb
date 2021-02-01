require "poker/judge.rb"

class Player
  include Judge_Two
  attr_reader :name, :cards, :hand
  
  def initialize(name:)
    @name = name
    @cards = []
    @hand = nil
  end

  def next_game
    @cards = []
    @hand = nil
  end

  def discard(card)
    suit = card.split("", 2)[0]
    rank = card.split("", 2)[1]
    cards.delete_if { |c| c.suit == suit && c.rank == rank }
  end

end