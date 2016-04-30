require 'promotions.rb'

describe Promotions do

  let(:offer_one) {double :offer_one}
  let(:offer_two) {double :offer_two}

  subject(:promotions) {described_class.new(offer_one, offer_two)}

  before do
    allow(offer_one).to receive(:reduction).and_return(10)
    allow(offer_two).to receive(:reduction).and_return(1.5)
  end

  describe '#calculate_discount' do
    it 'calculates the total reduction' do
      expect(promotions.calculate_discount([], 0)).to eq 11.5
    end
  end

end
