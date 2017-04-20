require_relative 'station'
require_relative 'journey'

## This class is responsible for creating items that allow users
## to travel between stations, with a monetary balance
class Oystercard
  attr_reader :balance, :new_journey
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
  end

  def top_up(n)
    message = "Sorry, you can't top up. The maximum is £#{MAX_BALANCE}."
    raise message if n + @balance > MAX_BALANCE
    @balance += n
  end

  def touch_in(station, zone)
    message = "Not enough balance. You'll need £#{MIN_BALANCE}."
    raise message if @balance < MIN_BALANCE
    create_journey.start_journey(create_station(station, zone))
  end

  def touch_out(station, zone)
    create_journey if @new_journey.nil?
    @new_journey.end_journey(create_station(station, zone))
    deduct(@new_journey.fare)
  end

  def create_journey
    @new_journey = Journey.new
  end

  def create_station(station, zone)
    @station = Station.new(station, zone)
  end

  private

  def deduct(n)
    @balance -= n
  end
end
