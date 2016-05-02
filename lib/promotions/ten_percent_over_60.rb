
class TenPercentOver60

  attr_reader :promotion_type

  def initialize
    @promotion_type = :percentage_discount
  end

  def apply_promotion items, subtotal
    calculate_promotion items, subtotal
  end

  private

  def calculate_promotion items, subtotal
    subtotal > 60 ? subtotal *= 0.9 : subtotal
  end

end
