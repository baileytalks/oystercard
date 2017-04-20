require_relative 'station'

## This class understands where the user has travelled to and from
class Journey
  attr_reader :journey_info

  def initialize
    @journey_info = { entry_station: nil, entry_zone: nil,
                      exit_station: nil, exit_zone: nil, complete: nil }
  end

  def start_journey(station)
    @journey_info[:entry_station] = station.name
    @journey_info[:entry_zone]    = station.zone
    complete?
  end

  def end_journey(station)
    @journey_info[:exit_station]  = station.name
    @journey_info[:exit_zone]     = station.zone
    complete?
  end

  def fare
    return 6 if @journey_info[:complete] == false
    1
  end

  def complete?
    if !@journey_info[:entry_station].nil? && !@journey_info[:exit_station].nil?
      @journey_info[:complete] = true
    else
      @journey_info[:complete] = false
    end
  end
end
