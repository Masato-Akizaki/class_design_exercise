require "./money"

coin10 = Money.new(name: "10円玉", value: 10)
coin50 = Money.new(name: "50円玉", value: 50)
coin100 = Money.new(name: "100円玉", value: 100)
coin500 = Money.new(name: "50円玉", value: 500)
bill1000 = Money.new(name: "1000円札", value: 1000)

monies = [coin10, coin50, coin100, coin500, bill1000]

total_charged_money = 0
change = 0
order = 0

while order < 5 do
  puts "------------------------------"
  index = 0
  monies.each do |money|
    puts "#{index}. #{money.name}"
    index += 1
  end
  puts "---------------"
  puts "5. 投入完了"
  puts "6. 払い戻し"

  puts "------------------------------"
  puts "投入するお金の番号を選択してください"

  order = gets.chomp.to_i
  if order < 5
    charged_money = monies[order]
    total_charged_money += charged_money.value
    puts "------------------------------"
    puts "投入したお金: #{charged_money.name}"
    puts "現在の投入金額の合計:#{total_charged_money}円"
  elsif order == 5
    puts "------------------------------"
    puts "投入金額の合計:#{total_charged_money}円"
  else
    change = total_charged_money
    puts "------------------------------"
    puts "釣り銭:#{change}円"
  end
end