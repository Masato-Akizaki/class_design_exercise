require "./drink.1"

class VendingMachine
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze  # 利用可能なお金のハッシュを作成（.freezeで値が変動しないようにしている）

  attr_reader :total, :sale_amount # インスタンス変数に読み出す

  def initialize  # newメゾットで作成したインスタンスに代入
    @total = 0  
    @sale_amount = 0 
    @drink_table = {} 
    5.times { store Drink.cola } 
  end

  # @drink_table={"cola" => {:price=>120, :stock=>5}, 
  #               "redbul" => {:price=>200, :stock=>1}
  #               "water" => {:price=>100, :stock=>1 }


  def insert(money)  # お金の投入
    AVAILABLE_MONEY.include?(money) ? nil.tap { @total += money } : money 
  end 

  def refund  # 釣り銭の返金
    total.tap { @total = 0 } 
  end

  def store(drink)  # 指定したドリンクを格納する
    nil.tap do  
      @drink_table[drink.name] =  { price: drink.price, stock: 0 } unless @drink_table.has_key? drink.name 
      @drink_table[drink.name][:stock] += 1  
    end
  end

  def purchase(drink_name)  # 指定したドリンクを購入する
    if purchasable? drink_name
      @drink_table[drink_name][:stock] -= 1
      price = @drink_table[drink_name][:price]
      @sale_amount += price 
      @total -= price  
      [drink_name, -price, refund]  
    end
  end

  def purchasable?(drink_name)  # 指定したドリンクが購入可能かどうか
    purchasable_drink_names.include? drink_name  
  end

  def purchasable_drink_names  # 購入可能なドリンクリスト
    @drink_table.select{ |_, info| info[:price] <= total && info[:stock] > 0 }.keys
  end

  def stock_info  # ストックされているドリンクの情報
    @drink_table
  end
end