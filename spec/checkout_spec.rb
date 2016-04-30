require 'checkout'

describe Checkout do

  let(:subtotal_klass) {double :subtotal_klass}
  let(:subtotal) {double :subtotal}
  let(:item_one) {double :item_one, code: 001, name: "Lavender Heart", price: 9.25}

  subject(:checkout) {described_class.new(subtotal_klass)}

  before do
    allow(subtotal_klass).to receive(:new).and_return(subtotal)
    allow(subtotal).to receive(:add_to_balance)
  end

  describe '#initialize' do

    it 'initializes with an empty items array' do
      expect(checkout.items).to eq []
    end

    it 'instantiates a new instance of a subtotal_klass' do
      expect(subtotal_klass).to receive(:new).and_return(subtotal)
      Checkout.new(subtotal_klass)
    end

  end

  describe '#scan' do

    it 'adds the value of the scanned item to the total' do
      expect(subtotal).to receive(:add_to_balance)
      checkout.scan(item_one)
    end

    it 'adds the scanned item to the items array' do
      checkout.scan(item_one)
      expect(checkout.items).to include item_one
    end

  end

end
