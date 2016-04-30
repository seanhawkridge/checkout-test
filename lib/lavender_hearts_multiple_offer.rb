
class LavenderHeartsMultiple

  def reduction(items, total)
    calculate_reduction(items, total)
  end

  private

  def calculate_reduction(items, total)
    lavender_hearts = count_lavender_hearts(items)
    amount = 0
    if lavender_hearts.length >= 2
      lavender_hearts.each { |lavender_heart| amount += 0.75 }
    end
    amount
  end

  def count_lavender_hearts(items)
    items.select{ |item| item.name == :"Lavender Heart" }
  end

end