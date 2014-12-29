require 'rails_helper'

RSpec.describe Category, :type => :model do
  let(:c) { Category.new}
  let(:new_category) {FactoryGirl.create(:category)}

  it "makes sure the Category is initialized correctrly" do
    expect(c).to be_kind_of(Category)
  end
  it "creates category with specified name" do
    expect(new_category.category_name).to eq("Test Category")
  end
end
