class Oystercard
  attr_reader :balance
  attr_reader :entry_station, :journeys, :exit_station
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
    @entry_station
    @journeys.push({:entry_station => entry_station})
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @exit_station = exit_station
    @exit_station
    @journeys.push({:exit_station => exit_station})
  end

  def in_journey?
    @entry_station.nil?
    false
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
