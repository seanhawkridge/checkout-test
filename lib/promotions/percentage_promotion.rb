
class PercentagePromotion

  attr_reader :promotion_type

  def initialize(threshold = 0, percentage = 0)
    @threshold = threshold
    @percentage = percentage
    @promotion_type = :percentage_discount
  end

  def apply_promotion items, subtotal
    calculate_promotion items, subtotal
  end

  private

  def calculate_promotion items, subtotal
    subtotal > @threshold ? subtotal *= percentage_multiplier(@percentage) : subtotal
  end

  def percentage_multiplier(percentage)
    (100 - percentage) * 0.01
  end

end
