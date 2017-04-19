require 'journey'

describe Journey do
  let(:card) { double :card }
  let(:station) { 'Mystery Station' }

  it '#history' do
    allow(card).to receive(:touch_in)
    card.touch_in(station)
    hash = {:entry_station=>"Mystery Station"}
    expect((card.journey).history).to eq hash
  end
end
