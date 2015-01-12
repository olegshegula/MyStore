require 'spec_helper'
require 'rails_helper'

describe Item do
  let(:i) { Item.new }
  let(:new_item) {FactoryGirl.create(:item)}


  it "should do something" do
    expect(1+1).to  be 2
  end
  it "makes sure the Item is initialized correctrly" do
    expect(i).to be_kind_of(Item)
  end

  it "creates a new item" do
      expect(new_item.price).to eq(10)
      expect(new_item.category_id).to eq(2)
      expect(new_item.weight).to eq(10)
      expect(new_item.real).to eq true
      expect(new_item.name).to eq("Item 1")
     
  end
end