FactoryGirl.define do
  factory :image do
    name 'MyString'
    description 'MyString'
    user_id nil
  end

  factory :invalid_image, parent: :image do
    name nil
  end
end
