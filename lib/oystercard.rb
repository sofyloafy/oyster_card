class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(num)
    fail "The maximum of #{MAXIMUM_BALANCE} would be exceeded." if balance + num > MAXIMUM_BALANCE
    @balance += num
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    @journey
  end

end
