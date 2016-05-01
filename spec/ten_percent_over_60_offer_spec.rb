require 'promotions/ten_percent_over_60.rb'

describe TenPercentOver60 do

  subject(:offer) {described_class}

  describe '#apply_promotion' do

    it 'calculates the correct reduction based on a given amount' do
      expect(offer.apply_promotion([], 100)).to eq 90
    end

  end

end
