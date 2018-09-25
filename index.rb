require "./money"

coin1 = Money.new(name: "1円玉", value: 1)
coin5 = Money.new(name: "5円玉", value: 5)
coin10 = Money.new(name: "10円玉", value: 10)
coin50 = Money.new(name: "50円玉", value: 50)
coin100 = Money.new(name: "100円玉", value: 100)
coin500 = Money.new(name: "50円玉", value: 500)
bill1000 = Money.new(name: "1000円札", value: 1000)
bill2000 = Money.new(name: "2000円札", value: 2000)
bill5000 = Money.new(name: "5000円札", value: 5000)
bill10000 = Money.new(name: "10000円札", value: 10000)

monies = [coin1, coin5, coin10, coin50, coin100, coin500,
          bill1000, bill2000, bill5000, bill10000]

total_charged_money = 0
order = 0

while order < 11 do
  puts "------------------------------"
  index = 1
  monies.each do |money|
    puts "#{index}. #{money.name}"
    index += 1
  end
  puts "---------------"
  puts "11. 投入完了"
  puts "12. 払い戻し"

  puts "---------------"
  puts "投入するお金の番号を選択してください"
  puts "１円玉、５円玉、千円札以外のお札は使用できません"

  order = gets.chomp.to_i
  puts "---------------"
   
  if order == 0 || order > 12
    order = 0
    puts "投入するお金の番号を選択してください！"

  elsif order < 11
    charged_money = monies[order-1]
    puts charged_money.charge_now
    if order > 2 && order < 8
      total_charged_money += charged_money.value
      puts "現在の投入金額の合計:#{total_charged_money}円"
    else
      puts charged_money.unusable_money(total_charged_money)
    end

  elsif order == 11
    puts "投入金額の合計:#{total_charged_money}円"
     
  else 
    change = total_charged_money
    puts "釣り銭:#{change}円"
  end
end 