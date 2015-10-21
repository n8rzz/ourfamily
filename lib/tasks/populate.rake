namespace :db do
    desc "Create posts"
    task :populate => :environment do
        require 'populator'
        require 'faker'
        30.times do |n|
            Post.create!(title: Faker::Lorem.sentence,
                         body: Faker::Lorem.paragraph,
                         created_at: Faker::Time.backward(182, :evening)
            )
        end
    end
end