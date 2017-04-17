class Oystercard
  attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize(balance=0)
    @balance = balance
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
