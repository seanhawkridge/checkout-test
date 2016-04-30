
class TenPercentOver60

  def reduction(items, total)
    calculate_reduction(items, total)
  end

  private

  def calculate_reduction(items, total)
    total > 60 ? total *= 0.1 : 0
  end

end
