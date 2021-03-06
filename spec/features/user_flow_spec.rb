require 'item'
require 'checkout'
require 'promotional_rules'
require 'promotions/percentage_promotion'
require 'promotions/multiple_items_promotion'

describe 'User flow' do

  let(:lavender_hearts_promotion) {MultipleItemsPromotion.new("001", 2, 0.75)}
  let(:ten_percent_over_60) {PercentagePromotion.new(60, 10)}
  let(:promotional_rules) {PromotionalRules.new(lavender_hearts_promotion, ten_percent_over_60)}
  let(:checkout) {Checkout.new(promotional_rules)}
  let(:item_one) {Item.new("001", "Lavender Heart", 9.25)}
  let(:item_two) {Item.new("002", "Personalised Cufflinks", 45.00)}
  let(:item_three) {Item.new("003", "Kids T-shirt", 19.95)}

  describe "scanning an item" do

    it 'adds the value of the item to the total' do
      checkout.scan(item_one)
      expect(checkout.total).to eq "£9.25"
    end

    it 'raises an error if the scanned object is not an item' do
      expect{checkout.scan(String.new)}.to raise_error "Not an item"
    end

  end

  describe "scanning multiple items" do

    it 'adds the value of multiple items to the total' do
      checkout.scan(item_one)
      checkout.scan(item_two)
      expect(checkout.total).to eq "£54.25"
    end

  end

  describe "calculating discounts" do

    it 'correctly processes a basket with no discounts' do
      checkout.scan(item_two)
      expect(checkout.subtotal).to eq 45.00
      expect(checkout.total).to eq "£45.00"
    end

    it 'correctly applies a discount for a balance over 60' do
      checkout.scan(item_two)
      checkout.scan(item_two)
      expect(checkout.subtotal).to eq 90
      expect(checkout.total).to eq "£81.00"
    end

    it 'correctly applies a discount for multiple lavender hearts' do
      checkout.scan(item_one)
      checkout.scan(item_one)
      expect(checkout.subtotal).to eq 18.50
      expect(checkout.total).to eq "£17.00"
    end

    it 'will only deduct promotions once' do
      checkout.scan(item_one)
      checkout.scan(item_two)
      checkout.scan(item_one)
      checkout.scan(item_three)
      expect(checkout.total).to eq "£73.76"
      expect(checkout.total).to eq "£73.76"
    end

    context 'running examples' do

      it 'correctly applies a discount for a basket of items' do
        checkout.scan(item_one)
        checkout.scan(item_two)
        checkout.scan(item_three)
        expect(checkout.total).to eq "£66.78"
      end

      it 'correctly applies a discount for a basket of items' do
        checkout.scan(item_one)
        checkout.scan(item_one)
        checkout.scan(item_three)
        expect(checkout.total).to eq "£36.95"
      end

      it 'correctly applies a discount for a basket of items' do
        checkout.scan(item_one)
        checkout.scan(item_two)
        checkout.scan(item_one)
        checkout.scan(item_three)
        expect(checkout.total).to eq "£73.76"
      end

    end

  end

end
