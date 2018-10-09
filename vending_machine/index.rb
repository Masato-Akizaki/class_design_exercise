require "./money"
require "./juice"

coin1 = Money.new(name: "1円玉", value: 1)
coin5 = Money.new(name: "5円玉", value: 5)
coin10 = Money.new(name: "10円玉", value: 10)
coin50 = Money.new(name: "50円玉", value: 50)
coin100 = Money.new(name: "100円玉", value: 100)
coin500 = Money.new(name: "500円玉", value: 500)
bill1000 = Money.new(name: "1000円札", value: 1000)
bill2000 = Money.new(name: "2000円札", value: 2000)
bill5000 = Money.new(name: "5000円札", value: 5000)
bill10000 = Money.new(name: "10000円札", value: 10000)

monies = [coin1, coin5, coin10, coin50, coin100, coin500,
          bill1000, bill2000, bill5000, bill10000]

juice1 = Juice.new(name: "コーラ", price: 120, stock: 5)
juice2 = Juice.new(name: "レッドブル", price: 200, stock: 5)
juice3 = Juice.new(name: "水", price: 100, stock: 5)

juices = [juice1, juice2, juice3]

juice_stocks = 0
juices.each do |juice|
  juice_stocks += juice.stock
end

total_charged_money = 0
total_sales = 0
order = 0

while juice_stocks > 0  do
  puts "------------------------------"
  puts "ドリンクメニュー"
  index = 1
  juices.each do |juice|
    puts "#{index}. #{juice.menu(total_charged_money)}"
    index += 1
  end
  puts "---------------"
  index = 101
  monies.each do |money|
    puts "#{index}. #{money.name}"
    index += 1
  end
  puts "※１円玉、５円玉、千円札以外のお札は使用不可"
  puts "---------------"
  puts "111. 払い戻し"
  puts "112. 現在の売り上げ"

  puts "---------------"
  puts "購入するジュース、又は、投入するお金の番号を選択してください"
  puts "現在の投入金額:#{total_charged_money}円"

  order = gets.chomp.to_i
  puts "---------------"
   
  if order >= 1 && order <= 3 # ジュースの購入
    selected_juice = juices[order - 1]
    if selected_juice.stock > 0 && selected_juice.price <= total_charged_money
      puts selected_juice.purchase(total_charged_money)
      total_sales += selected_juice.price
      total_charged_money = 0
      juice_stocks -= 1
    elsif selected_juice.stock == 0
      puts "売り切れです"
    else
      puts "お金が足りません"
    end

  elsif order > 100 && order < 111 # お金の投入
    charged_money = monies[order - 101]
    puts charged_money.charge_now
    if order > 102 && order < 108
      total_charged_money += charged_money.value
    else
      puts charged_money.unusable_money(total_charged_money)
    end

  elsif order == 111 # 払い戻し
    change = total_charged_money
    total_charged_money = 0
    puts "釣り銭:#{change}円"

  elsif order == 112 # 現在の売り上げ
    puts "現在の売り上げ金額:#{total_sales}円"
     
  else # order <= 0 || order > 112 || (order > 3 && order <112)
    order = 0
    puts "購入するジュース、又は、投入するお金の番号を選択してください！"
  end
end

change = total_charged_money
total_charged_money = 0
puts "******************************"
puts "完売しました"
puts "釣り銭:#{change}円"
puts "売り上げ金額:#{total_sales}円"