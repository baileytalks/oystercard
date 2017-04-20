require 'station'

describe Station do
  it { is_expected.to respond_to :name }

  it { is_expected.to respond_to :zone }

  it 'passes a name into the name variable' do
    station = described_class.new('Old Street', 1)
    expect(station.name).to eq 'Old Street'
  end

  it 'passes a zone into the zone variable' do
    station = described_class.new('Old Street', 1)
    expect(station.zone).to eq 1
  end
end
