require "./drink"

class VendingMachine
  AVAILABLE_MONEY = [10, 50, 100, 500, 1000].freeze  # 利用可能なお金のハッシュを作成（.freezeで値が変動しないようにしている）

  attr_reader :total, :sale_amount # インスタンス変数に読み出す

  def initialize  # newメゾットで作成したインスタンスに代入
    @total = 0  # 投入金額を定義
    @sale_amount = 0  # 売上合計を定義
    @drink_table = {}  # 空のハッシュを作成
    5.times { store Drink.cola }  # drink_tableに5回コーラをstore（格納）
  end

  def insert(money)  # お金の投入
    AVAILABLE_MONEY.include?(money) ?  # 三項演算子（投入されたお金が、利用可能なお金に含まれているか）
      nil.tap { @total += money } : money  # true: nilを返し、投入金額に加算する  false: 投入されたお金を返す
  end  # .tap : 戻り値はレシーバ自身　{}内の処理は行われる

  def refund  # 釣り銭の返金
    total.tap { @total = 0 }  # 元のtotalの値を返して、totalを0にする
  end

  def store(drink)  # 指定したドリンクを格納する
    nil.tap do  # nilを返す。以下の処理は行われる
      @drink_table[drink.name] =  # 空のハッシュにdrink.nameをキーにしてハッシュを代入 (ハッシュが二重)
        { price: drink.price,  # priceをキーにしてdrink.price、drinksをキーにしてからの配列を代入
          drinks: [] }  unless @drink_table.has_key? drink.name  # ハッシュの中にdrink.nameのキーが無ければ代入する（1種のdrinkの名前のキーは１つしかない）
      @drink_table[drink.name][:drinks] << drink  # drink.nameキーの中のハッシュの:drinksキーの中の配列にインスタンス変数を代入
    end
  end
  # @drink_tableの形 ↓
  # @drink_table={"cola"=>{:price=>120, :drinks=>[#<Drink:0x00007fa9b6139d60 @name="cola", @price=120>, ...]}, "redbul"=>{:price=>200, :drinks[....]}}

  def purchese(drink_name)  # 指定したドリンクを購入する
    if purchesable? drink_name  # もしドリンクが購入可能なら
      drink = @drink_table[drink_name][:drinks].pop  #:drinksキーの配列内の最後のインスタンス変数を削除し、削除したインスタンス変数を代入する（.pop）
      @sale_amount += drink.price  # 売上合計にdrink.priceを追加
      @total -= drink.price  # 投入金額からdrink.priceを引く
      [drink, refund]  # 配列から削除したインスタンス変数と、投入金額=釣り銭として返す 
    end
  end

  def purchesable?(drink_name)  # 指定したドリンクが購入可能かどうか
    purchesable_drink_names.include? drink_name  # 購入可能なドリンクリストにdrink.name含まれているか
  end

  def purchesable_drink_names  # 購入可能なドリンクリスト
    @drink_table.select{ |_, info| info[:price] <= total && info[:drinks].any? }.keys
  end
  # .select{|key, value|}  value = {price: ... , drinks:[..]} 
  # infoにハッシュがされており、priceがtotalより大きいかつ、drinksが空ではない場合、ハッシュに格納する（.select）
  # .keysでハッシュからキー（drink.naem）だけを取り出して配列にして返す

  def stock_info  # ストックされているドリンクの情報
    Hash[@drink_table.map {|name, info| [name, {price: info[:price], stock: info[drinks].size}]}]
  end
  # Hash[] => 新しくハッシュを生成して返す（配列を交互にkey,valueとして？）
  # .map => 要素の数だけ繰り返しブロックを実行し、ブロックの戻り値を集めた配列を作成して返す
  # .size => 配列の要素の数を返す
  # info[:drinks].size => インスタンス変数の数、つまり格納されているドリンクの数となる

end