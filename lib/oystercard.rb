require 'journey'

class Oystercard
  attr_reader :journeys, :balance
  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(num)
    message = "The maximum of #{MAXIMUM_BALANCE} would be exceeded."
    fail message if balance + num > MAXIMUM_BALANCE
    @balance += num
  end

  def touch_in(entry_station)
    fail "Insufficient funds." if @balance < MINIMUM_FARE
    deduct(PENALTYCHARGE) if in_journey? 
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
  end

  private

  def deduct(fare)
    @balance -= fare
    fare = MINIMUM_FARE
    fare
  end
end
