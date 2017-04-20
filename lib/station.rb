## This class understands how to create a new tube station
class Station
  attr_reader :zone, :name

  def initialize(name = 'Mystery Station', zone = 100)
    @name = name
    @zone = zone
  end
end
