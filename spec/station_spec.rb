require 'station'

describe Station do
  describe '#initialize' do
    it 'gives the station a name' do
      station = described_class.new('Old Street', 1)
      expect(station.name).to eq 'Old Street'
    end

    it 'assigns a zone to the station' do
      station = described_class.new('Old Street', 1)
      expect(station.zone).to eq 1
    end
  end
end
