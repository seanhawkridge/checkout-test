
class Checkout

  attr_reader :items

  def initialize(subtotal_klass)
    @subtotal = subtotal_klass.new
    @items = []
  end

  def scan(item)
    add_to_subtotal(item)
    add_to_items(item)
  end

  def total
    @subtotal.balance
  end

  private

  def add_to_subtotal(item)
    @subtotal.add_to_balance(item.price)
  end

  def add_to_items(item)
    @items << item
  end

end
