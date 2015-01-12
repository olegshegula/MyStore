FactoryGirl.define do
  factory :order_item do
    item_id 1
    order_id 1
    unit_price 10
    quantity 2
    total_price 1.5
  end

end
