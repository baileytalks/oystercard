## This class understands where the user has travelled to and from
class Journey
  attr_reader :journey_info

  def initialize(station)
    @journey_info = {:entry_station => station}
  end

  def end_journey(station)
    @journey_info.merge!(:exit_station => station)
  end
end
