class Player
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

  # このメソッド使ってない？？
  def discard(card)
    suit = card.split("", 2)[0]
    rank = card.split("", 2)[1]
    cards.delete_if { |c| c.suit == suit && c.rank == rank }
  end

  # これより下のjudge系のメソッドは2カードポーカー用のjudgeクラス作っても良さそうです
  def judge_hand
    if straight? && flush?
      # シンボル使うとrubyっぽくなります
      # 例「:straight_flush」
      @hand = "Straight-Flush"
    elsif pair?
      @hand = "Pair"
    elsif straight?
      @hand = "Straight"
    elsif flush?
      @hand = "Flush"
    else
      @hand = "High-Card"
    end
  end

  def pair?
    cards[0].has_same_rank?(cards[1])
  end

  def straight?
    # このロジックもcardクラスにメソッド作ってあげても良いかもです
    # 使用例：cards[0].serial_rank?(cards[1])
    serial_number?(Card::RANKS.index(cards[0].rank) , Card::RANKS.index(cards[1].rank))
  end

  def flush?
    cards[0].has_same_suit?(cards[1])
  end

  def serial_number?(a, b)
    (a-b).abs == 1 || (a-b).abs == 12
  end
end
