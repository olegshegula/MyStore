require 'rails_helper'
require 'spec_helper'

RSpec.describe OrderItem, :type => :model do
  let(:oi1) {FactoryGirl.create(:order_item)}

  it "makes sure the OrderItem is initialized correctrly" do
     expect(oi1).to be_kind_of(OrderItem)
  end

   it "makes sure that subtotal summ of item_orders calculates correct " do
     expect(oi1.total_price).to eq 20
   end

  it "makes sure that unit_price method works correct" do
    expect(oi1.unit_price).to eq 10
  end

 end
