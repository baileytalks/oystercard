require 'journey'

describe Journey do
  let(:card)    { Oystercard.new }
  let(:station) { 'Test Station' }
  let(:zone)    { 1 }

  it 'the journey is incomplete if the card only touches out' do
    card.top_up(10)
    card.touch_out(station, zone)
    expect(card.new_journey.journey_info[:complete]).to eq false
  end

  it 'the journey is complete if the card touches in and touches out' do
    card.top_up(10)
    card.touch_in(station, zone)
    card.touch_out(station, zone)
    expect(card.new_journey.journey_info[:complete]).to eq true
  end
end
