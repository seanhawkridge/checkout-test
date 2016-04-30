require 'promotions.rb'

describe Promotions do

  let(:offer_one) {double :offer_one}
  let(:offer_two) {double :offer_two}
  let(:subtotal) {double :subtotal}
  let(:items) {double :items}

  subject(:promotions) {described_class.new(offer_one, offer_two)}

  before do
    allow(offer_one).to receive(:apply_promotion).and_return(90)
    allow(offer_two).to receive(:apply_promotion).and_return(80)
    allow(subtotal).to receive(:balance).and_return(100)
  end

  describe '#apply_promotions' do
    it 'applies the promotions to the subtotal' do
      expect(promotions.apply_promotions([], 100)).to eq 80
    end
  end

end
