require 'promotions/multiple_items_promotion.rb'

describe MultipleItemsPromotion do

  subject(:promotion) {described_class.new(item_code = "001", threshold = 2, discount_per_item = 0.75)}

  let(:item_one) {double :item_one, code: :"001", name: :"Lavender Heart", price: 9.25}
  let(:item_two) {double :item_two, code: :"002", name: :"Kids T-Shirt", price: 19.95}
  let(:checkout) {double :checkout, items: [item_one, item_one, item_two], total: 38.45}

  before do
    allow(item_one).to receive(:product_code).and_return(:"001")
    allow(item_two).to receive(:product_code).and_return(:"002")
  end

  describe '#apply_promotion' do

    it 'calculates the correct reduction given items and total' do
      expect(promotion.apply_promotion(checkout.items, checkout.total)).to eq 36.95
    end

  end

end
