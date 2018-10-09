require "./poker/player.rb"
require "./poker/deck.rb"

class Game
  attr_reader :players, :deck
  
  def initialize
    @players = []
    @deck = Deck.new
  end

  def join(name)
    players << Player.new(name: name)
    @name = name
    @name = players.last
  end

  def deal_card(name, n)
    n.times { players.select { |p| p.name == name }[0].cards << @deck.deck.pop }
    players.select { |p| p.name == name }[0].cards
  end

end
