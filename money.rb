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

end