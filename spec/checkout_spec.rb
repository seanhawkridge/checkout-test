require 'checkout'

describe Checkout do

  subject(:checkout) {described_class.new}

  let(:item_one) {double :item_one, code: 001, name: "Lavender Heart", price: 9.25}

  describe '#initialize' do
    it 'initializes with a total of 0' do
      expect(checkout.total).to eq 0
    end
  end

  describe '#scan' do
    it 'adds the value of the scanned item to the total' do
      checkout.scan(item_one)
      expect(checkout.total).to eq 9.25
    end
  end

end
