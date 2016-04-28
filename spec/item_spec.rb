require 'item'

describe Item do

  subject(:item) {described_class.new(001, 'Lavender Heart', 9.25)}

  describe '#initialize' do

    it 'initializes with a code' do
      expect(item.code).to eq 001
    end

    it 'initializes with a name' do
      expect(item.name).to eq 'Lavender Heart'
    end

    it 'initializes with a price' do
      expect(item.price).to eq 9.25
    end

  end

end
