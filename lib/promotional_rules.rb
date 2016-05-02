require_relative 'promotions/ten_percent_over_60.rb'
require_relative 'promotions/lavender_hearts_multiple_offer.rb'

class PromotionalRules

  def initialize *promotions
    @promotions = promotions
  end

  def apply_promotions items, subtotal
    subtotal_after_item_discounts = calculate_item_discounts items, subtotal
    subtotal_after_total_discounts = calculate_total_discounts items, subtotal_after_item_discounts
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
