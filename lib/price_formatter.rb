
class PriceFormatter

  def self.result(amount)
    format_amount(amount)
  end

  private

  def self.format_amount(amount)
    "£#{float_amount(amount)}"
  end

  def self.float_amount(amount)
    "%.2f" % amount
  end

end
