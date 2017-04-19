class Station
  attr_reader :zone, :name

  def initialize(name = 'Mystery Station', zone = 100)
    @name = name
    @zone = zone
  end
end
