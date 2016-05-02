
class LavenderHeartsMultiple

  attr_reader :promotion_type

  def initialize
    @promotion_type = :item_discount
  end

  def apply_promotion items, subtotal
    calculate_promotion items, subtotal
  end

  private

  def calculate_promotion items, subtotal
    lavender_hearts = count_lavender_hearts items
    if lavender_hearts.length >= 2
      lavender_hearts.each { subtotal -= 0.75 }
    end
    subtotal
  end

  def count_lavender_hearts items
    items.select { |item| item.name == :"Lavender Heart" }
  end

end
