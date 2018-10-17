module Judge_Two

  def judge_hand
    if straight? && flush?
      @hand = :Straight_Flush
    elsif pair?
      @hand = :Pair
    elsif straight?
      @hand = :Straight
    elsif flush?
      @hand = :Flush
    else
      @hand = :High_Card
    end
  end

  def pair?
    cards[0].has_same_rank?(cards[1])
  end

  def straight?
    cards[0].serial_rank?(cards[1])
  end 

  def flush?
    cards[0].has_same_suit?(cards[1])
  end
end