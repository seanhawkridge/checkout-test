require 'promotions/ten_percent_over_60.rb'

describe TenPercentOver60 do

  subject(:offer) {described_class.new}

  describe '#initialize' do

    it 'should initialize with the correct promotion type' do
      expect(offer.promotion_type).to eq :total_discount
    end

  end

  describe '#apply_promotion' do

    it 'calculates the correct 10% reduction based on a given amount' do
      expect(offer.apply_promotion([], 100)).to eq 90
    end

  end

end
