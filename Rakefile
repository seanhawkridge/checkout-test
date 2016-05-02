require './lib/item.rb'
require './lib/checkout.rb'
require './lib/subtotal.rb'
require './lib/price_formatter.rb'
require './lib/promotions.rb'
require './lib/promotions/lavender_hearts_multiple_offer.rb'
require './lib/promotions/ten_percent_over_60.rb'

namespace :examples do

  task :all => [:example_one, :example_two, :example_three]

  ten_percent_offer = TenPercentOver60.new
  lavender_hearts_offer = LavenderHeartsMultiple.new
  pr = Promotions.new(lavender_hearts_offer, ten_percent_offer)
  lavender_heart = Item.new("001", "Lavender Heart", 9.25)
  cufflinks = Item.new("002", "Personalised Cufflinks", 45.00)
  t_shirt = Item.new("003", "Kids T-shirt", 19.95)

  task :example_one do

    co = Checkout.new(pr)

    co.scan(lavender_heart)
    co.scan(cufflinks)
    co.scan(t_shirt)
    puts "Basket: #{co.items.map { |item| item.product_code.to_s }}"
    puts "Total: #{co.total}"

  end

  task :example_two do

    co = Checkout.new(pr)

    co.scan(lavender_heart)
    co.scan(t_shirt)
    co.scan(lavender_heart)
    puts "Basket: #{co.items.map { |item| item.product_code.to_s }}"
    puts "Total: #{co.total}"

  end

  task :example_three do

    co = Checkout.new(pr)

    co.scan(lavender_heart)
    co.scan(cufflinks)
    co.scan(lavender_heart)
    co.scan(t_shirt)
    puts "Basket: #{co.items.map { |item| item.product_code.to_s }}"
    puts "Total: #{co.total}"

  end

end
