require 'rails_helper'

describe 'user registration' do
  subject { page }

  before do
    visit '/users/sign_up'
  end

  it { should have_css('h2', text: 'Create a new account') }
  it { should have_selector('h2.hdg') }

  describe 'allows new users to register' do
    before do
      fill_in 'Email', with: 'jimbob@bobstires.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'

      click_button 'Sign up'
    end

    it { should have_content('Welcome! You have signed up successfully.') }
  end
end
