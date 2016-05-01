
class TenPercentOver60

  def self.apply_promotion(items, total)
    calculate_promotion(items, total)
  end

  private

  def self.calculate_promotion(items, total)
    total > 60 ? total *= 0.9 : total
  end

end
