
class Subtotal

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def add_to_balance(amount)
    @balance += amount
  end

  def deduct_from_balance(amount)
    @balance -= amount
  end

end
