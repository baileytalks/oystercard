class Oystercard
  attr_reader :balance, :in_journey

  MAXIMUM_BALANCE = 90

  def initialize(balance=0)
    @balance = balance
    @in_journey = false
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def top_up(n)
    if (@balance + n) > MAXIMUM_BALANCE
      raise "Maximum balance £#{MAXIMUM_BALANCE} reached"
    else
    @balance += n
    end
  end

  def deduct(n)
    @balance -= n
  end

end
