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
    apply_promotions
    @subtotal.balance
  end

  private

  def apply_promotions
    amount = @promotional_rules.calculate_discount(@items, @subtotal.balance)
    @subtotal.deduct_from_balance(amount)
  end

  def add_to_subtotal(item)
    @subtotal.add_to_balance(item.price)
  end

  def add_to_items(item)
    @items << item
  end

end
