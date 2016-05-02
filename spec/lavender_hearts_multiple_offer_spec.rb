require 'promotions/lavender_hearts_multiple_offer.rb'

describe LavenderHeartsMultiple do

  subject(:offer) {described_class.new}

  let(:item_one) {double :item_one, code: 001, name: :"Lavender Heart", price: 9.25}
  let(:item_two) {double :item_two, code: 002, name: :"Kids T-Shirt", price: 19.95}
  let(:checkout) {double :checkout, items: [item_one, item_one, item_two], total: 38.45}

  describe '#initialize' do

    it 'should initialize with the correct promotion type' do
      expect(offer.promotion_type).to eq :item_discount
    end

  end

  describe '#apply_promotion' do
    it 'calculates the correct reduction given items and total' do
      expect(offer.apply_promotion(checkout.items, checkout.total)).to eq 36.95
    end
  end

end
