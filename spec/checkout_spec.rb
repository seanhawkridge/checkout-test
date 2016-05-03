require 'checkout'

describe Checkout do

  let(:subtotal_klass) {double :subtotal_klass}
  let(:promotional_rules) {double :promotional_rules}
  let(:subtotal) {double :subtotal}
  let(:priceformatter) {double :priceformatter}
  let(:item_one) {double :item_one, product_code: 001, name: "Lavender Heart", price: "9.25"}

  subject(:checkout) {described_class.new(promotional_rules)}

  before do
    allow(subtotal).to receive(:add_to_balance)
    allow(subtotal).to receive(:update)
    allow(subtotal).to receive(:balance).and_return(9.25)
    allow(priceformatter).to receive(:result).and_return("£9.25")
    allow(promotional_rules).to receive(:apply_promotions)
    allow(item_one).to receive(:is_a?).with(Item).and_return(true)
    checkout.instance_variable_set(:@subtotal, subtotal)
  end

  describe '#initialize' do

    it 'initializes with an empty items array' do
      expect(checkout.items).to eq []
    end

    it "will initialize without a promotions object" do
      expect{Checkout.new}.to_not raise_error
    end

    it "will overide the default with a promotions object" do
      expect{Checkout.new(promotional_rules)}.to_not raise_error
    end

  end

  describe '#scan' do

    it 'sends #add_to_balance to the subtotal object' do
      expect(subtotal).to receive(:add_to_balance)
      checkout.scan(item_one)
    end

    it 'adds the scanned item to the items array' do
      checkout.scan(item_one)
      expect(checkout.items).to include item_one
    end

    it 'adds multiple scanned items to the items array' do
      checkout.scan(item_one)
      checkout.scan(item_one)
      expect(checkout.items).to include item_one, item_one
    end

    it 'raises an error if a scanned object is not of the type Item' do
      expect{checkout.scan(String.new)}.to raise_error "Not an item"
    end

  end

  describe '#total' do

    it 'sends #apply_promotions to the promotions object' do
      expect(promotional_rules).to receive(:apply_promotions)
      checkout.total
    end

    it 'only attempts to process the discounts once' do
      expect(promotional_rules).to receive(:apply_promotions).once
      checkout.total
      checkout.total
    end

    it 'returns the formatted total' do
      expect(checkout.total).to eq "£9.25"
    end

  end

end
