require 'ten_percent_over_60.rb'

describe TenPercentOver60 do

  subject(:offer) {described_class.new}

  describe '#reduction' do
    it 'calculates the correct reduction based on a given amount' do
      expect(offer.reduction([], 100)).to eq 10
    end
  end

end
