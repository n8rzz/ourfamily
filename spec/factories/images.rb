FactoryGirl.define do
  factory :image do
    name 'MyString'
    description 'MyString'
    user_id nil
    # sequence(:user_id)
    # sequence(:post_id)
  end

  factory :invalid_image, parent: :image do
    name nil
  end
end
