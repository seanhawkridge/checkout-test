require 'promotional_rules'

describe PromotionalRules do

  let(:offer_one) {double :offer_one, promotion_type: :item_discount}
  let(:offer_two) {double :offer_two, promotion_type: :percentage_discount}
  let(:not_an_offer) {double :not_an_offer}
  let(:subtotal) {double :subtotal}
  let(:items) {double :items}

  subject(:promotional_rules) {described_class.new(offer_one, offer_two)}

  before do
    allow(offer_one).to receive(:apply_promotion).and_return(90)
    allow(offer_two).to receive(:apply_promotion).and_return(80)
    allow(subtotal).to receive(:balance).and_return(100)
  end

  describe '#apply_promotions' do

    it 'applies the promotions to the subtotal' do
      expect(promotional_rules.apply_promotions([], 100)).to eq 80
    end

    it "raises an error is the promotion is not valid (doesn't respond to apply_promotion)" do
      broken_promotions = PromotionalRules.new(not_an_offer)
      expect{broken_promotions.apply_promotions([], 100)}
        .to raise_error "#{not_an_offer.class} is not a valid promotion"
    end

  end

end
