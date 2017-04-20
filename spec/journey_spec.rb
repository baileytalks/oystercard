require 'journey'

describe Journey do
  let(:card) { Oystercard.new }
  let(:station) { 'Mystery Station' }

  it '#history' do
    card.top_up(5)
    expect(card.touch_in(station)).to be_a(Journey)
  end
end
