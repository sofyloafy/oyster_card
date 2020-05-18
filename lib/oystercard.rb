class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(num)
    fail "The maximum of #{MAXIMUM_BALANCE} would be exceeded." if balance + num > MAXIMUM_BALANCE
    @balance += num
  end

end
