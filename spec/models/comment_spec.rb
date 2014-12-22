require 'spec_helper'
require 'rails_helper'

describe Comment do
  let(:c) { Comment.new}

  it "makes sure the Comment is initialized correctrly" do
    expect(c).to be_kind_of(Comment)
  end
end