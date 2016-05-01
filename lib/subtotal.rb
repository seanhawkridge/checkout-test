
class Subtotal

  attr_reader :balance

  def initialize
    @balance = 0.0
  end

  def add_to_balance amount
    @balance += amount
  end

  def update total
    @balance = total
  end

end
