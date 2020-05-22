require 'journey'

describe Journey do
  let(:entry_station) { double :station }
  let(:exit_station) {double :station }
  let(:journey){ [{entry_station: entry_station, exit_station: exit_station}]}


  context "#journey" do
    it "should remember the station in which the card was touched in" do
      expect(subject.begin_trip(entry_station)).to eq([entry_station: entry_station])
    end

    it "should remember the journey" do
      subject.begin_trip(entry_station)
      subject.end_trip(exit_station)
      expect(subject.journeys).to eq journey
    end

    it "should know if the journey is complete" do
      subject.begin_trip(entry_station)
      subject.end_trip(exit_station)
      expect(subject.complete?).to eq true
    end

    it "should know if a journey is incomplete" do
      subject.begin_trip(entry_station)
      expect(subject.complete?).to eq false
    end
  end
end