class Oystercard
  attr_reader :journeys, :balance, :entry_station, :exit_station
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
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
  end

  def in_journey?
    !!@last_station
  end
  
  def add_trip
    @journeys << { entry_station:  @entry_station, exit_station: @exit_station }
  end

  private

  def deduct(fare)
    fare = MINIMUM_FARE
    @balance -= fare
  end
end
