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

  describe '#deduct_from_balance' do
    it 'deducts a given amount from the balance' do
      subtotal.deduct_from_balance(10)
      expect(subtotal.balance).to eq (-10)
    end
  end

end
