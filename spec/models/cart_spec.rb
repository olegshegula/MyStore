require 'spec_helper'
require 'rails_helper'

describe Cart do
  let(:cart) { Cart.new}

  it "makes sure the Cart is initialized correctrly" do
    expect(cart).to be_kind_of(Cart)
  end
end