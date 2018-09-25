class Money
  attr_accessor :name
  attr_accessor :value

  def initialize(name:, value:)
    self.name = name
    self.value = value
  end

  def charge_now
    return "投入したお金: #{self.name}"
  end

  def unusable_money(total)
    change = self.value
    puts "#{self.name}は使用できません"
    puts "現在の投入金額の合計:#{total}円"
    return "釣り銭:#{change}円"
  end
end