class Drink
  attr_reader :name, :price

  def self.cola  # colaを生成する（nameとpriceを入力を省略できる）
    self.new(name: "cola", price: 120, stock: 0)
  end

  def self.redbull # redbullを生成する（nameとpriceを入力を省略できる）
    self.new(name: "redbull", price: 200, stock: 0)
  end

  def self.water # waterを生成する（nameとpriceを入力を省略できる）
    self.new(name: "water", price: 100, stock: 0)
  end

  def initialize(name:, price:, stock:)  # newメゾットで作成したインスタンスに代入
    @name = name
    @price = price
    @stock = stock
  end


end
