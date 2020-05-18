require 'oystercard'
describe Oystercard do
  it "should have a default balance of zero" do
    card = Oystercard.new
    expect(card.balance).to eq 0
  end
end
