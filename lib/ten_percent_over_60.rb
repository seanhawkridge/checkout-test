
class TenPercentOver60

  def self.reduction(items, total)
    calculate_reduction(items, total)
  end

  private

  def self.calculate_reduction(items, total)
    total > 60 ? total *= 0.1 : 0
  end

end
