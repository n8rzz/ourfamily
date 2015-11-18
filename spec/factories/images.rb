FactoryGirl.define do
  factory :image do
    name 'Sample Image Name'
    description 'Sample Image Description'
    user_id nil
  end

  factory :invalid_image, parent: :image do
    name nil
  end
end
