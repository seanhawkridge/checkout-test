
class LavenderHeartsMultiple

  def self.apply_promotion items, total
    calculate_promotion items, total
  end

  private

  def self.calculate_promotion items, total
    lavender_hearts = count_lavender_hearts items
    if lavender_hearts.length >= 2
      lavender_hearts.each { total -= 0.75 }
    end
    total
  end

  def self.count_lavender_hearts items
    items.select { |item| item.name == :"Lavender Heart" }
  end

end
