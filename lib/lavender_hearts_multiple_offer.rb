
class LavenderHeartsMultiple

  def self.reduction(items, total)
    calculate_reduction(items, total)
  end

  private

  def self.calculate_reduction(items, total)
    lavender_hearts = items.select{ |item| item.name == :"Lavender Heart" }
    p lavender_hearts
    amount = 0
    if lavender_hearts.length >= 2
      lavender_hearts.each { |lavender_heart| amount += 0.75 }
    end
    amount
  end

  #
  # def count_lavender_hearts(items)
  #
  # end

end
