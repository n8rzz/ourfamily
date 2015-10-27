include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :post do
    sequence(:id) { '#{n}' }
    title 'MyString'
    body 'MyText'
    published '2015-10-18 21:37:56'
    user_id 1
  end

  factory :invalid_post, parent: :post do
    title nil
  end
end
