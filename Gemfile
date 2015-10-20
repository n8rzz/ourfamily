source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.2.1'
gem 'devise', '3.4.1'
gem 'pg'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'omniauth', '~> 1.2.2'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'


group :development, :test do
  gem 'rspec-rails', '3.2.1'
  gem 'capybara', '~> 2.4.4'
  gem 'byebug'
  gem 'spring'
  gem 'faker', '~> 1.5.0'
  gem 'populator', '~> 1.0.0'
  gem 'better_errors', '~>2.1.1'
end

group :test do
  gem 'factory_girl_rails', '4.4.1'
  gem 'shoulda-matchers', '2.8.0'
  gem 'guard-rspec', '4.5.0', require: false
end

group :production do
    gem 'rails_12factor'
end