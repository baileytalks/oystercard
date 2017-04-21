require 'oystercard'

describe Oystercard do
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  let(:station) { double :station, name: 'Test Station', zone: 1 }

  describe '#balance' do
    it 'has default balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'can increase the balance' do
      expect { subject.top_up 1 }.to change { subject.balance }.by 1
    end

    it 'fails when maximum capacity is exceeded' do
      message = "Sorry, you can't top up. The maximum is £#{MAX_BALANCE}."
      subject.top_up(80)
      expect { subject.top_up(20) }.to raise_error message
    end
  end

  describe '#touch_in' do
    it 'throws an error when insufficient funds on the card to touch in' do
      message = "Not enough balance. You'll need £#{MIN_BALANCE}."
      expect { subject.touch_in(station) }.to raise_error message
    end

    it 'creates a new journey when a card touches in' do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.new_journey).to be_a(Journey)
    end
  end

  describe '#touch_out' do
    before do
      subject.top_up(5)
    end

    it 'creates a new journey if a card only touches out' do
      subject.touch_in(station)
      expect(subject.new_journey).to be_a(Journey)
    end

    it 'deducts the minimum fare when touching out' do
      subject.touch_in(station)
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-1)
    end

    it 'deducts a penalty fare when touching out if journey is not complete' do
      expect { subject.touch_out(station) }.to change { subject.balance }.by(-6)
    end
  end
end
