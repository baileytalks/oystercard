## This class is responsible for starting, finishing and recording
## multiple journeys
class JourneyLog
  attr_reader :log
  def initialize(journey = Journey)
    @log = []
    @journey_class = journey
  end

  def add(item)
    @log.push(item) if item.is_a?(Journey)
  end
end
