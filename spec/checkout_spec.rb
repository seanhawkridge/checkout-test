require 'checkout'

describe Checkout do

  subject(:checkout) {described_class.new}

  describe '#initialize' do
    it 'initializes with a total of 0' do
      expect(checkout.total).to eq 0
    end
  end

end
