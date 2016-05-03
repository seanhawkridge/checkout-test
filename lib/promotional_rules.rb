require_relative 'promotions/percentage_promotion.rb'
require_relative 'promotions/multiple_items_promotion.rb'

class PromotionalRules

  def initialize *promotions
    validate_promotions(promotions)
    @promotions = promotions
  end

  def apply_promotions items, subtotal
    item_discount_subtotal = calculate_promotions items, subtotal, :item_discount
    percentage_discount_subtotal = calculate_promotions items, item_discount_subtotal, :percentage_discount
  end

  private

  def calculate_promotions items, subtotal, type
    @promotions.each do |promotion|
      subtotal = promotion.apply_promotion items, subtotal if promotion.promotion_type == type
    end
    subtotal
  end

  def validate_promotions(promotions)
    promotions.each do |promotion|
      raise "#{promotion.class} is not a valid promotion" unless valid_promotion?(promotion)
    end
  end

  def valid_promotion?(promotion)
    promotion.methods.include?(:apply_promotion)
  end

end
