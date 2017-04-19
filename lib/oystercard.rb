## The Oystercard class is responsible for creating and managing oystercards
class Oystercard
  attr_reader :balance, :entry_station, :journey_history
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE    = 1

  def initialize
    @balance = 0
    @journey_history = {}
  end

  def top_up(n)
    message = "Sorry, you can't top up. The maximum is £#{MAX_BALANCE}."
    raise message if n + @balance > MAX_BALANCE
    @balance += n
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(station)
    message = "Not enough balance. You'll need £#{MIN_BALANCE}."
    raise message if @balance < MIN_BALANCE
    @entry_station = station
    @journey_history[:entry_station] = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @entry_station = nil
    @journey_history[:exit_station] = station
  end

  private

  def deduct(n)
    @balance -= n
  end
end
