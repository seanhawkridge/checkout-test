require './lib/subtotal.rb'

class Checkout

  attr_reader :items

  def initialize(promotional_rules)
    @subtotal = Subtotal.new
    @promotional_rules = promotional_rules
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
