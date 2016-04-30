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
    format_total(@subtotal.balance)
  end

  private

  def apply_promotions
    updated_total = @promotional_rules.apply_promotions(@items, @subtotal.balance)
    @subtotal.apply_promotions(updated_total)
  end

  def add_to_subtotal(item)
    @subtotal.add_to_balance(item.price)
  end

  def add_to_items(item)
    @items << item
  end

  def format_total(amount)
    "£#{float_total(amount)}"
  end

  def float_total(amount)
    "%.2f" % amount
  end

end
