# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence(:id) { |n| "#{n}" }
    title "MyString"
    body "MyText"
    published "2015-10-18 21:37:56"
  end
end
