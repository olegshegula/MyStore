FactoryGirl.define do
  factory :user do
  login "login"
  sequence(:email) { |i| "email#{i}@email.com" }
  password "123456789"
  end
end