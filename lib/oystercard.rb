require_relative 'station'
require_relative 'journey'
require_relative 'journey_log'

## This class is responsible for creating items that allow users
## to travel between stations, with a monetary balance
class Oystercard
  attr_reader :balance, :new_journey, :journey_log
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  ## Using the argument below because it apparently makes creating a
  ## double in Rspec tests a lot easier
  def initialize(journey_log = JourneyLog.new)
    @balance = 0
    @journey_log = journey_log
  end

  def top_up(n)
    message = "Sorry, you can't top up. The maximum is £#{MAX_BALANCE}."
    raise message if n + @balance > MAX_BALANCE
    @balance += n
  end

  def touch_in(station)
    message = "Not enough balance. You'll need £#{MIN_BALANCE}."
    raise message if @balance < MIN_BALANCE
    @journey_log.start_journey(station)
  end

  def touch_out(station)
    @journey_log.finish_journey(station)
    deduct(@journey_log.journey.fare)
    @journey_log.add(@journey_log.journey)
    @journey_log.journey = nil
  end

  private

  def deduct(n)
    @balance -= n
  end
end
