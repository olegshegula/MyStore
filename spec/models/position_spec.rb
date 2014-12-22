require 'spec_helper'
require 'rails_helper'

describe Position do
  let(:p) { Position.new}

  it "makes sure the Position is initialized correctrly" do
    expect(p).to be_kind_of(Position)
  end
end