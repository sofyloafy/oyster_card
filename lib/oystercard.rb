class Oystercard
  attr_reader :balance
  DEFAULT_VALUE = 90

  def initialize
    @balance = 0
  end

  def top_up(num)
    fail "Maximum would be exceeded" if balance + num > DEFAULT_VALUE
    @balance += num
  end

end
