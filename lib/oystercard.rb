class Oystercard
  attr_reader :balance, :entry_station
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE    = 1

  def initialize
    @balance = 0
  end

  def top_up(pounds)
    fail "Limit of £#{MAXIMUM_BALANCE} Exceeded" if pounds + @balance > MAXIMUM_BALANCE
    @balance += pounds
  end

  def in_journey?
    if @entry_station == nil
      false
    else
      true
    end
  end

  def touch_in(station)
    fail "Insufficient balance – (£#{MINIMUM_BALANCE}) needed" if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  private
  def deduct(pounds)
    @balance -= pounds
  end
end
