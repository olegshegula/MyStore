require 'spec_helper'
require 'rails_helper'

describe Order do
  let(:o) { FactoryGirl.create(:order)}
  let(:item1) {FactoryGirl.create(:item)}
  let(:item2) {FactoryGirl.create(:item, price: 20)}

  it "makes sure the Order is initialized correctrly" do
    expect(o).to be_kind_of(Order)
  end

  # xit "calculates the total price of the order" do
    # o.items << item1
    # o.items << item2
    # o.calculate_total
    # expect(o.total).to eq(30)
  # end
  it "makes sure the default order status is 1" do
    expect(o.order_status_id).to eq 1
  end

end