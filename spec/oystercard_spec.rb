require 'oystercard'
require 'journey'

describe Oystercard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }


  it "should have a default balance of zero" do
    expect(subject.balance).to eq 0
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
      it "should charge the right fare when touched out" do
        expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Journey::FARE)
      end
    end
  end
end
