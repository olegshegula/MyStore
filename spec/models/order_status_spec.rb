require 'rails_helper'

RSpec.describe OrderStatus, :type => :model do

  let(:os) { OrderStatus.new}
  let(:order_progress) {FactoryGirl.create(:order_status)}
  let(:order_placed) {FactoryGirl.create(:order_status,name:"Placed")}
  let(:order_shipped) {FactoryGirl.create(:order_status,name:"Shipped")}
  let(:order_cancelled) {FactoryGirl.create(:order_status,name:"Cancelled")}

  it "makes sure the OrderStatus is initialized correctrly" do
    expect(os).to be_kind_of(OrderStatus)
  end

  it "makes sure that OrderStatus consist of In Progress item" do
    expect(order_progress.name).to eq "In Progress"
  end

  it "makes sure that OrderStatus consist of Placed item" do
    expect(order_placed.name).to eq "Placed"
  end
  it "makes sure that OrderStatus consist of Shipped item" do
    expect(order_shipped.name).to eq "Shipped"
  end

  it "makes sure that OrderStatus consist of Cancelled item" do
    expect(order_cancelled.name).to eq "Cancelled"
  end
end
