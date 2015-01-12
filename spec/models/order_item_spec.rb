require 'rails_helper'
require 'spec_helper'

RSpec.describe OrderItem, :type => :model do

  let(:o) {FactoryGirl.create(:order)}
  let(:oi) {OrderItem.new}

  it "makes sure the OrderItem is initialized correctrly" do
    expect(oi).to be_kind_of(OrderItem)
  end

  it ""



 end
