require './lib/subtotal.rb'
require './lib/price_formatter.rb'

class Checkout

  attr_reader :items

  def initialize promotional_rules
    @subtotal = Subtotal.new
    @priceformatter = PriceFormatter
    @promotional_rules = promotional_rules
    @items = []
  end

  def scan item
    raise "Not an item" unless item.is_a? Item
    add_to_subtotal item
    add_to_items item
  end

  def total
    apply_promotions
    @priceformatter.format @subtotal.balance
  end

  private

  def apply_promotions
    updated_total = @promotional_rules.apply_promotions @items, @subtotal.balance
    @subtotal.apply_promotions updated_total
  end

  def add_to_subtotal item
    @subtotal.add_to_balance item.price
  end

  def add_to_items item
    @items << item
  end

end
