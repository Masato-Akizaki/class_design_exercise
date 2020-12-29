require "vending_machine/drink"

class Stock
  attr_reader :drink_stock

  def initialize
    @drink_stock = {} 
    5.times { store Drink.cola } 
  end

  def store(drink)  # 指定したドリンクを格納する
    nil.tap do  
      @drink_stock[drink.name] =  { price: drink.price, drinks: [] } unless @drink_stock.has_key? drink.name 
      @drink_stock[drink.name][:drinks] << drink
    end
  end

  def info  # ストックされているドリンクの情報
    Hash[@drink_stock.map {|name, info| [name, {price: info[:price], stock: info[:drinks].size}]}]
  end

end