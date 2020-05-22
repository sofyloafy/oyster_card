require 'journey'

class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @journey = Journey.new
  end

  def top_up(num)
    message = "The maximum of #{MAXIMUM_BALANCE} would be exceeded."
    fail message if balance + num > MAXIMUM_BALANCE
    @balance += num
  end

  def touch_in(entry_station)
    fail "Insufficient funds." if @balance < MINIMUM_FARE
    @journey.begin_trip(entry_station)
  end

  def touch_out(exit_station)
    @journey.end_trip(exit_station)
    deduct
  end

  private

  def deduct
    @balance -= @journey.fare
  end
end
