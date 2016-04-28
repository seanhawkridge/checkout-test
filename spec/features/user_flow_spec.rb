require 'item'
require 'checkout'

describe 'User flow' do

  let(:checkout) {Checkout.new}
  let(:item_one) {Item.new(001, "Lavender Heart", 9.25)}
  let(:item_two) {Item.new(002, "Personalised Cufflinks", 45.00)}
  let(:item_three) {Item.new(003, "Kids T-shirt", 19.95)}

  describe "scanning an item" do
    it 'adds the value of the item to the total' do
      checkout.scan(item_one)
      expect(checkout.total).to eq (9.25)
    end
  end

  describe "scanning multiple items" do
    it 'adds the value of multiple items to the total' do
      checkout.scan(item_one)
      checkout.scan(item_two)
      expect(checkout.total).to eq (54.25)
    end
  end

end
