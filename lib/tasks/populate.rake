namespace :db do
    desc "Create posts"
    task :populate => :environment do
        require 'populator'
        require 'faker'
        30.times do |n|
            Post.create!(title: Faker::Lorem.sentence,
                         body: Faker::Lorem.paragraph,
                         created_at: n.days.ago,
                         user_id: Faker::Number.between(1, 7)
            )
        end

        # 2.times do |n|
        #     Family.create!(subdomain: Faker::Name.last_name)
        # end
        User.create!(first_name: 'Tom',
                     last_name: 'Tomkins',
                     birthday: '02/23/1990',
                     email: 'tom@eample.com',
                     password: 'password',
                     current_sign_in_at: Faker::Time.between(3.days.ago, Time.now, :all),
                     last_sign_in_at: Faker::Time.between(7.days.ago, 3.days.ago, :all),
                     created_at: Faker::Time.between(180.days.ago, 7.days.ago, :all)
        )

        7.times do |n|
            first_name = Faker::Name.first_name
            last_name = Faker::Name.last_name
            password = Faker::Internet.password(8)

            User.create!(first_name: first_name,
                         last_name: last_name,
                         birthday: '01/01/1960',
                         email: Faker::Internet.free_email,
                         password: password,
                         current_sign_in_at: Faker::Time.between(3.days.ago, Time.now, :all),
                         last_sign_in_at: Faker::Time.between(7.days.ago, 3.days.ago, :all),
                         created_at: Faker::Time.between(180.days.ago, 7.days.ago, :all)
            )
        end
    end
end
