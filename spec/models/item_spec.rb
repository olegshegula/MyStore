require 'spec_helper'
require 'rails_helper'

describe Item do
  let(:i) { Item.new }

  it "should do something" do
    expect(1+1).to  be 2
  end
  it "makes sure the Item is initialized correctrly" do
    expect(i).to be_kind_of(Item)
  end
end