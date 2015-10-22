include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :post do
    sequence(:id) { '#{n}' }
    title 'MyString'
    body 'MyText'
    published '2015-10-18 21:37:56'
  end

  factory :post_attachment do
    sequence(:id) { '#{n}' }
    title 'MyString'
    body 'MyText'
    published '2015-10-18 21:37:56'
    photo { fixture_file_upload(Rails.root.join('spec/fixtures/test_post_photo.jpg'), 'image/jpg') }
  end
end
