FactoryGirl.define do
  factory :user do
  sequence(:email) { |i| "email#{i}@email.com" }
  password "123456789"
  end
end