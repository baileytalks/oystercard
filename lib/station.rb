## This class understands how to create a new location from where a journey
## can either begin or end
class Station
  attr_reader :name, :zone

  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end
