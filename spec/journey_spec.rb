require 'journey'

describe Journey do
  let(:entry_station) { double :entry_station, name: 'Entry Station', zone: 1 }
  let(:exit_station) { double :exit_station, name: 'Exit Station', zone: 2 }

  it '#start_journey' do
    subject.start_journey(entry_station)
    expect(subject.journey_info[:complete]).to eq false
  end

  it '#end_journey' do
    subject.start_journey(entry_station)
    subject.end_journey(exit_station)
    expect(subject.journey_info[:complete]).to eq true
  end

  it '#complete?' do
    subject.start_journey(entry_station)
    subject.end_journey(exit_station)
    expect(subject.complete?).to eq true
  end
end
