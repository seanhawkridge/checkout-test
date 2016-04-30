
class Promotions

  def initialize(*args)
    @promotions = args
    @discounts = []
  end

  def calculate_discount(items, total)
    calculate_discounts(items, total)
    @discounts.inject(:+)
  end

  private

  def calculate_discounts(items, total)
    @promotions.each do |promotion|
      @discounts << promotion.reduction(items, total)
    end
  end

end
