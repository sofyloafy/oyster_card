require 'oystercard'

describe Oystercard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }


  it "should have a default balance of zero" do
    expect(subject.balance).to eq 0
  end


  it "should have an empty list of journeys by default" do
    expect(subject.journeys).to be_empty
  end


  describe '#top_up' do
    [2,32].each do |num|
      it "should increase balance by the argument" do
        subject.top_up(num)
        expect(subject.balance).to eq(0 + num)
      end
    end


    it "should raise an error when if balance would go above maximum" do
    maximum = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum)
    expect{ subject.top_up(1) }.to raise_error "The maximum of #{maximum} would be exceeded."
    end
  end


  describe '#touch_in' do
    context "should change journey to true" do
      before do
        subject.top_up(5)
        subject.touch_in(entry_station)
      end
      it "should remember the station in which the card was touched in" do
        expect(subject.touch_in(entry_station)).to eq(entry_station)
      end
    end
    it "should raise a fail message when balance below mininum fare" do
      expect{ subject.touch_in(entry_station) }.to raise_error "Insufficient funds."
    end
  end

  describe '#touch_out' do
    context "should change journey to false" do
      before do
        subject.top_up(5)
        subject.touch_in(entry_station)
        subject.touch_out(exit_station)
      end
      it 'stores exit station' do
        expect(subject.touch_out(exit_station)).to eq(exit_station)
      end
    end
    it "should charge mininum fare when touched out" do
      min_fare = Oystercard::MINIMUM_FARE
      expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-min_fare)
    end
    
  end

  describe "#journey" do
    it 'stores a journey' do
      subject.top_up(4)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.add_trip).to include journey
    end
  end
end

