
class Promotions

  def initialize(*args)
    @promotions = args
  end

  def apply_promotions(items, total)
    calculate_promotions(items, total)
  end

  private

  def calculate_promotions(items, total)
    @promotions.each do |promotion|
      total = promotion.apply_promotion(items, total)
    end
    total
  end

end
