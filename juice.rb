class Juice
  attr_accessor :name
  attr_accessor :price
  attr_accessor :stock

  def initialize(name:, price:, stock:)
    self.name = name
    self.price = price
    self.stock = stock
  end

  def menu
    return "#{self.name}: #{self.price}円 （在庫:#{self.stock}本）"
  end
end