
class MultipleItemsPromotion

  attr_reader :promotion_type

  def initialize item_code = nil, threshold = 0, discount_per_item = 0
    @item_code = item_code.to_sym
    @threshold = threshold
    @discount_per_item = discount_per_item
    @promotion_type = :item_discount
  end

  def apply_promotion items, subtotal
    calculate_promotion items, subtotal
  end

  private

  def calculate_promotion items, subtotal
    valid_items = count_valid_items items
    if valid_items.length >= @threshold
      valid_items.each { subtotal -= @discount_per_item }
    end
    subtotal
  end

  def count_valid_items items
    items.select { |item| item.product_code == @item_code }
  end

end
