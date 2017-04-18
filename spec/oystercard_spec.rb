require './lib/oystercard'

describe Oystercard do
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1
  let(:station) { 'London' }

  it 'has default balance of 0' do
    expect(subject.balance).to eq(0)
  end

  describe 'topping up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
    it 'can increase the balance' do
      expect { subject.top_up 1 }.to change { subject.balance }.by 1
    end

    it 'fails when maximum capacity is exceeded' do
      message = "Sorry, you can't top up. The maximum is £#{MAX_BALANCE}."
      subject.top_up(80)
      expect { subject.top_up 20 }.to raise_error message
    end
  end

  describe '#in_journey?' do
    it 'starts off being not in a journey' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it 'changes to true when touched in' do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end

    it 'throws an error when insufficient funds on the card to touch in' do
      message = "Not enough balance. You'll need £#{MIN_BALANCE}."
      expect { subject.touch_in(station) }.to raise_error message
    end

    it 'saves an entry station' do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.entry_station).to eq 'London'
    end
  end

  describe '#touch_out' do
    it 'changes back to false when touching out' do
      subject.top_up(5)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end

    it 'forgets entry_station' do
      subject.top_up(5)
      subject.touch_in(station)
      expect { subject.touch_out }.to change { subject.entry_station }.to eq nil
    end

    it 'deducts the minimum fare when touching out' do
      subject.top_up(5)
      subject.touch_in(station)
      expect { subject.touch_out }.to change { subject.balance }.by(-MIN_FARE)
    end
  end
end
