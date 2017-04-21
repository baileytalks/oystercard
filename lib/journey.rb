require_relative 'station'

## This class understands where the user has travelled to and from
class Journey
  attr_reader :journey_info
  PENALTY_CHARGE  = 6
  MIN_FARE        = 1

  def initialize
    @journey_info = { entry_station: nil, entry_zone: nil,
                      exit_station: nil, exit_zone: nil, complete: nil }
  end

  def start_journey(station)
    @journey_info[:entry_station] = station.name
    @journey_info[:entry_zone]    = station.zone
    @journey_info[:complete]      = complete?
  end

  def end_journey(station)
    @journey_info[:exit_station]  = station.name
    @journey_info[:exit_zone]     = station.zone
    @journey_info[:complete]      = complete?
  end

  def fare
    return PENALTY_CHARGE if @journey_info[:complete] == false
    MIN_FARE
  end

  def complete?
    !@journey_info[:entry_station].nil? && !@journey_info[:exit_station].nil?
  end
end
