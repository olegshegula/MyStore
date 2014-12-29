FactoryGirl.define do
  factory :item do
    price 10
    category_id 2
    weight 10
    real true
    name "Item 1"
    descriptions "some info"
  end
end