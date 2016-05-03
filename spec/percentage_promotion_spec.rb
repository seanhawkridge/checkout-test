require 'promotions/percentage_promotion'

describe PercentagePromotion do

  subject(:promotion) {described_class.new(threshold = 60, percentage = 10)}

  describe '#apply_promotion' do

    it 'calculates the correct 10% reduction based on a given amount' do
      expect(promotion.apply_promotion([], 100)).to eq 90
    end

  end

end
