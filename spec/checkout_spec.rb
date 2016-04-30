require 'checkout'

describe Checkout do

  let(:subtotal_klass) {double :subtotal_klass}
  let(:promotional_rules) {double :promotional_rules}
  let(:subtotal) {double :subtotal}
  let(:item_one) {double :item_one, code: 001, name: "Lavender Heart", price: 9.25}

  subject(:checkout) {described_class.new(promotional_rules)}

  before do
    allow(subtotal_klass).to receive(:new).and_return subtotal
    allow(subtotal).to receive(:new)
    allow(subtotal).to receive(:add_to_balance)
    checkout.instance_variable_set(:@subtotal, subtotal)
  end

  describe '#initialize' do

    it 'initializes with an empty items array' do
      expect(checkout.items).to eq []
    end

  end

  describe '#scan' do

    it 'calls #add_to_balance in subtotal object' do
      expect(subtotal).to receive(:add_to_balance)
      checkout.scan(item_one)
    end

    it 'adds the scanned item to the items array' do
      checkout.scan(item_one)
      expect(checkout.items).to include item_one
    end

  end

  describe '#total' do

    it 'calls #balance in subtotal object' do
      expect(subtotal).to receive(:balance)
      checkout.total
    end

  end

end
