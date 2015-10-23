namespace :db do
    desc "Create posts"
    task :populate => :environment do
        require 'populator'
        require 'faker'
        30.times do |n|
            Post.create!(title: Faker::Lorem.sentence,
                         body: Faker::Lorem.paragraph,
                         created_at: n.days.ago
            )
        end

        # 2.times do |n|
        #     Family.create!(subdomain: Faker::Name.last_name)
        # end
    end
end