require 'checkout'

describe Checkout do

  let(:subtotal_klass) {double :subtotal_klass}
  let(:promotional_rules) {double :promotional_rules}
  let(:subtotal) {double :subtotal}
  let(:item_one) {double :item_one, product_code: 001, name: "Lavender Heart", price: "9.25"}

  subject(:checkout) {described_class.new(promotional_rules)}

  before do
    allow(subtotal).to receive(:add_to_balance)
    allow(subtotal).to receive(:deduct_from_balance)
    allow(subtotal).to receive(:balance).and_return(10)
    allow(promotional_rules).to receive(:calculate_discount)
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

    it 'applies the promotions' do
      expect(promotional_rules).to receive(:calculate_discount)
      checkout.total
    end

    it 'returns the total' do
      expect(checkout.total).to eq 10
    end

  end

end
