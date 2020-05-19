require 'station'

describe Station do

  subject { described_class.new(name: "Oxford Circus", zone: 1) }
 
  it "should return name" do
    expect(subject.name).to eq("Oxford Circus")
  end

  it "should know its zone" do
    expect(subject.zone).to eq(1)
  end

end