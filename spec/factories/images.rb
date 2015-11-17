FactoryGirl.define do
  factory :image do
    name 'MyString'
    description 'MyString'
  end

  factory :invalid_image, parent: :image do
    name nil
  end
end
