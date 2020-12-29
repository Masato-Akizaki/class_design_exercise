module Judge_Two

  def judge_hand
    if straight? && flush?
      @hand = :straight_flush
    elsif pair?
      @hand = :pair
    elsif straight?
      @hand = :straight
    elsif flush?
      @hand = :flush
    else
      @hand = :high_card
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