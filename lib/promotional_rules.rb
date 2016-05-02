require_relative 'promotions/ten_percent_over_60.rb'
require_relative 'promotions/lavender_hearts_multiple_offer.rb'

class PromotionalRules

  def initialize *promotions
    @promotions = promotions
  end

  def apply_promotions items, subtotal
    item_discount_subtotal = calculate_promotions items, subtotal, :item_discount
    percentage_discount_subtotal = calculate_promotions items, item_discount_subtotal, :percentage_discount
  end

  private

  def calculate_promotions items, subtotal, type
    @promotions.each do |promotion|
      raise "#{promotion.class} is not a valid promotion" unless promotion.methods.include?(:apply_promotion)
      subtotal = promotion.apply_promotion items, subtotal if promotion.promotion_type == type
    end
    subtotal
  end

end
