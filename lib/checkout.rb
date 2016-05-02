require_relative 'subtotal.rb'
require_relative 'price_formatter.rb'

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
    return if promotions_applied?
    updated_total = @promotional_rules.apply_promotions @items, @subtotal.balance
    @subtotal.update updated_total
    @promotions_applied = true
  end

  def add_to_subtotal item
    @subtotal.add_to_balance item.price
  end

  def add_to_items item
    @items << item
  end

  def promotions_applied?
    @promotions_applied == true
  end

end
