require 'item'
require 'checkout'
require 'subtotal'
require 'promotions'
require 'lavender_hearts_multiple_offer'
require 'ten_percent_over_60'

describe 'User flow' do

  let(:promotional_rules) {Promotions.new(LavenderHeartsMultiple, TenPercentOver60)}
  let(:checkout) {Checkout.new(promotional_rules)}
  let(:subtotal) {Subtotal.new}
  let(:item_one) {Item.new(001, "Lavender Heart", 9.25)}
  let(:item_two) {Item.new(002, "Personalised Cufflinks", 45.00)}
  let(:item_three) {Item.new(003, "Kids T-shirt", 19.95)}

  before do
    checkout.instance_variable_set(:@subtotal, subtotal)
  end

  describe "scanning an item" do

    it 'adds the value of the item to the total' do
      checkout.scan(item_one)
      expect(checkout.total).to eq 9.25
    end

  end

  describe "scanning multiple items" do

    it 'adds the value of multiple items to the total' do
      checkout.scan(item_one)
      checkout.scan(item_two)
      expect(checkout.total).to eq 54.25
    end

  end

  describe "calculating discounts" do

    it 'correctly applies a discount for a balance over 60' do
      checkout.scan(item_two)
      checkout.scan(item_two)
      expect(subtotal.balance).to eq 90
      expect(checkout.total).to eq 81
    end

  end

end
