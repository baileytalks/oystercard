require 'journey_log'
require 'journey'

## This test is dependent on the Journey.rb file, and the Journey class
## I need help to fix this!
describe JourneyLog do
  let(:journey) { Journey.new}

  describe '#log' do
    it 'expects log to be an array' do
      expect(subject.log).to be_a(Array)
    end
  end

  describe '#add' do
    it 'expects a non-Journey to be rejected when adding to log' do
      subject.add('String not a Journey')
      expect(subject.log).to eq []
    end

    it 'expects a Journey to be accepted and added to log' do
      subject.add(journey)
      expect(subject.log).to eq [journey]
    end
  end
end
