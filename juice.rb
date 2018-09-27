class Juice
  attr_accessor :name
  attr_accessor :price
  attr_accessor :stock

  def initialize(name:, price:, stock:)
    self.name = name
    self.price = price
    self.stock = stock
  end

  def menu(total)
    return "#{self.name}: #{self.price}円【#{self.purchasable?(total)}】（在庫:#{self.stock}本）"
  end

  def purchasable?(total)
    if self.stock > 0 && self.price <= total
      return "購入可"
    elsif self.stock == 0
      return "売り切れ"
    else
      return "入金不足"
    end
  end

  def purchase(total)
    self.stock -= 1
    total -= self.price
    puts "ご購入ありがとうございます"
    return "現在の投入金額:#{total}円"
  end
end