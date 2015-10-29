# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    id 1
    first_name 'Tom'
    last_name 'Tomkins'
    email 'tom@example.com'
    birthday '02/28/1990'
    password 'password'
    password_confirmation 'password'
  end
end
