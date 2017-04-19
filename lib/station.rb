## This class creates new tube stations from thin air
class Station
  attr_reader :zone, :name

  def initialize(name = 'Mystery Station', zone = 100)
    @name = name
    @zone = zone
  end
end
