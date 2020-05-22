# require 'oystercard'
class Journey
attr_accessor :journeys
PENALTY = 6
FARE = 1

  def initialize
    @journeys = []
  end

  def begin_trip(station)
    @entry_station = station
    @journeys.push({entry_station: @entry_station})
  end

  def end_trip(station)
    @exit_station = station
    @journeys[-1].store(:exit_station, @exit_station)
  end

  def complete?
    @journeys[-1] == {entry_station: @entry_station, exit_station: @exit_station}
  end

  def fare
    complete? ? FARE : PENALTY
  end
end
