require 'spec_helper'
require 'rails_helper'

describe User do
  let(:u) { User.new}

  it "makes sure the User is initialized correctrly" do
    expect(u).to be_kind_of(User)
  end
end