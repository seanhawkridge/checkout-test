
class Promotions

  def initialize *args
    @promotions = args
  end

  def apply_promotions items, total
    calculate_promotions items, total
  end

  private

  def calculate_promotions items, total
    @promotions.each do |promotion|
      raise "#{promotion.class} is not a valid promotion" unless promotion.respond_to?(:apply_promotion)
      total = promotion.apply_promotion items, total
    end
    total
  end

end
