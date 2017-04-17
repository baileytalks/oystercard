require 'oystercard'

describe Oystercard do

  describe '#initialize' do
    it "every new oyster card should have a balance of £0" do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it "allows a top_up amount to be added to the balance" do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
    it "raises an error if we try to top up more than £90 (the max balance) to an empty card" do
      expect{ subject.top_up(95) }.to raise_error "Maximum balance £#{Oystercard::MAXIMUM_BALANCE} reached"
    end
    it "raises an error if we top up and the new total balance would be more than the max allowed (£90)" do
      subject.top_up(85)
      expect{ subject.top_up(10) }.to raise_error "Maximum balance £#{Oystercard::MAXIMUM_BALANCE} reached"
    end
  end

  describe '#deduct' do
    it "deducts the amount given from the Oystercard when someone takes a journey" do
      subject.top_up(40)
      subject.deduct(10)
      expect(subject.balance).to eq 30
    end
  end

  describe '#in_journey?' do
    it "expects a newly created Oystercard to not be in use on a journey" do
      expect(subject.in_journey).to eq false
    end
  end

  describe '#touch_in' do
    it "expects a card that has been touched in to be in use on a journey" do
      subject.touch_in
      expect(subject.in_journey).to eq true
    end
  end

  describe '#touch_out' do
    it "expects a card that has been touched out to not be in use on a journey" do
      subject.touch_out
      expect(subject.in_journey).to eq false
    end
  end

end
