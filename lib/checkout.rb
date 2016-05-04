class Checkout

  attr_reader :subtotal, :items

  def initialize promotional_rules = nil
    @subtotal = 0.0
    @promotional_rules = promotional_rules
    @promotions_applied = false
    @items = []
  end

  def scan item
    raise "Not an item" unless item.is_a? Item
    add_to_subtotal item.price
    add_to_items item
  end

  def total
    apply_promotions if has_promotions? && !promotions_applied
    print_total subtotal
  end

  private

  attr_reader :promotional_rules, :promotions_applied

  def apply_promotions
    amount = promotional_rules.apply_promotions items, subtotal
    update_subtotal amount
    @promotions_applied = true
  end

  def add_to_subtotal amount
    @subtotal += amount.to_f
  end

  def update_subtotal amount
    @subtotal = amount
  end

  def add_to_items item
    items << item
  end

  def has_promotions?
    promotional_rules != nil
  end

  def print_total amount
    "£#{float_amount amount}"
  end

  def float_amount amount
    "%.2f" % amount
  end

end
