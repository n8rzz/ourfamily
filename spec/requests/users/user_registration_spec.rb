require 'rails_helper'

describe 'user registration' do
  subject { page }

  before { visit new_user_registration_path }

  describe 'allows new users to register' do
    before do
      fill_in 'First name', with: 'Jim'
      fill_in 'Last name', with: 'Bob'
      fill_in 'Birthday', with: '03/13/1980'
      fill_in 'Email', with: 'jimbob@bobstires.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'

      click_button 'Sign up'
    end

    it { should have_content('Welcome! You have signed up successfully.') }
  end
end
