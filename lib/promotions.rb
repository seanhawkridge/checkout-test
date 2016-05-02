
class Promotions

  def initialize *args
    @promotions = args
  end

  def apply_promotions items, subtotal
    subtotal = calculate_item_discounts items, subtotal
    subtotal = calculate_total_discounts items, subtotal
  end

  private

  def calculate_promotions items, subtotal, type
    @promotions.each do |promotion|
      raise "#{promotion.class} is not a valid promotion" unless promotion.methods.include?(:apply_promotion)
      subtotal = promotion.apply_promotion items, subtotal if promotion.promotion_type == type
    end
    subtotal
  end

  def calculate_item_discounts items, subtotal
    calculate_promotions items, subtotal, :item_discount
  end

  def calculate_total_discounts items, subtotal
    calculate_promotions items, subtotal, :total_discount
  end

end
