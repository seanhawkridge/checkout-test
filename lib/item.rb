class Item

  attr_reader :product_code, :name, :price

  def initialize product_code, name, price
    @product_code = product_code.to_sym
    @name = name.to_sym
    @price = price
  end

end
