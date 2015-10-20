namespace :db do
    desc "Create posts"
    task :populate => :environment do
        require 'populator'
        require 'faker'
        25.times do |n|
            Post.create!(title: Faker::Lorem.sentence,
                         body: Faker::Lorem.paragraph,
                         published: Faker::Date.backward(30))
        end
    end
end