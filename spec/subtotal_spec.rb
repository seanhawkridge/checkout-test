require 'subtotal'

describe Subtotal do

  subject(:subtotal) {described_class.new}

  describe '#initialize' do
    it 'initializes with a balance of 0' do
      expect(subtotal.balance).to eq 0
    end
  end

  describe '#add_to_balance' do
    it 'adds a given amount to the balance' do
      subtotal.add_to_balance(10)
      expect(subtotal.balance).to eq 10
    end
  end

  describe '#apply_promotions' do
    it 'applies the promotions to the balance' do
      subtotal.apply_promotions(20)
      expect(subtotal.balance).to eq (20)
    end
  end

end
