require 'oystercard'

describe Oystercard do
  it "should have a default balance of zero" do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end

  describe '#top_up' do
    [2,32].each do |num|
      it "should increase balance by the argument" do
        subject.top_up(num)
        expect(subject.balance).to eq(0 + num)
      end
    end
  end


end
