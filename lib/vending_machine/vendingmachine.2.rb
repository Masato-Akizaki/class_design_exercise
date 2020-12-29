require "vending_machine/stock"

class VendingMachine
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze  # 利用可能なお金の配列を作成（.freezeで値が変動しないようにしている）
  attr_reader :total, :sale_amount, :stock # インスタンス変数に読み出す

  def initialize  # newメゾットで作成したインスタンスに代入
    @total = 0  
    @sale_amount = 0
    @stock = Stock.new
  end

  def insert(money)  # お金の投入
    AVAILABLE_MONEY.include?(money) ? nil.tap { @total += money } : money 
  end 

  def refund  # 釣り銭の返金
    total.tap { @total = 0 } 
  end

  def store(drink)  # 指定したドリンクを格納する
    stock.store(drink)
  end

  def purchase(drink_name)  # 指定したドリンクを購入する
    if purchasable? drink_name
      drink = @stock.drink_stock[drink_name][:drinks].pop
      @sale_amount += drink.price 
      @total -= drink.price  
      [drink, refund] 
    end
  end

  def purchasable?(drink_name)  # 指定したドリンクが購入可能かどうか
    purchasable_drink_names.include? drink_name  
  end

  def purchasable_drink_names  # 購入可能なドリンクリスト
    stock.drink_stock.select{ |_, info| info[:price] <= total && info[:drinks].any? }.keys
  end

end