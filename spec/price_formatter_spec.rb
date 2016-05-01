require 'price_formatter'

describe PriceFormatter do

  subject(:priceformatter) {described_class}

  describe '#result' do

    it 'presents the properly formatted amount' do
      expect(priceformatter.result(12.123)).to eq "£12.12"
    end

  end

end
