require 'lavender_hearts_multiple_offer.rb'

describe LavenderHeartsMultiple do

  subject(:offer) {described_class}

  let(:item_one) {double :item_one, code: 001, name: :"Lavender Heart", price: 9.25}
  let(:item_two) {double :item_two, code: 002, name: :"Kids T-Shirt", price: 19.95}
  let(:checkout) {double :checkout, items: [item_one, item_one, item_two], total: 38.45}

  describe '#apply_promotion' do
    it 'calculates the correct reduction given items and total' do
      expect(offer.apply_promotion(checkout.items, checkout.total)).to eq 36.95
    end
  end

end
