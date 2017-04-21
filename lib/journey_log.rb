## This class is responsible for starting, finishing and recording
## multiple journeys
class JourneyLog
  attr_accessor :log, :journey

  def initialize(journey = Journey)
    @log           = []
    @journey_class = journey
    @journey       = nil
  end

  def add(item)
    @log.push(item) if item.is_a?(Journey)
  end

  def start_journey(station)
    current_journey
    @journey.journey_info[:entry_station] = station.name
    @journey.journey_info[:entry_zone]    = station.zone
    @journey.journey_info[:complete]      = complete?
  end

  def finish_journey(station)
    current_journey if @journey.nil?
    @journey.journey_info[:exit_station] = station.name
    @journey.journey_info[:exit_zone]    = station.zone
    @journey.journey_info[:complete]     = complete?
  end

  def complete?
    !@journey.journey_info[:entry_station].nil? && !@journey.journey_info[:exit_station].nil?
  end

  private

  def current_journey
    @journey = Journey.new
  end

  # def journeys
  # end
end
