FactoryGirl.define do
  factory :order_item do
    item
    order
    unit_price 10
    quantity 2

  end

end
