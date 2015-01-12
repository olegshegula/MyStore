require 'rails_helper'
require 'spec_helper'

RSpec.describe OrderItem, :type => :model do
  let(:new_item) {FactoryGirl.create(:item)}
  let(:o) {FactoryGirl.create(:order)}
  let(:oi1) {FactoryGirl.create(:order_item)}

  it "makes sure the OrderItem is initialized correctrly" do
     expect(oi1).to be_kind_of(OrderItem)
  end

   # it "makes sure that subtotal summ of item_orders calculates correct " do
   #
   # end

 end
