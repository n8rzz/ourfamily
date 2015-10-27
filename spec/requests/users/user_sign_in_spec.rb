require 'rails_helper'

describe 'user login' do
  subject { page }

  before do
    visit '/users/sign_in'
  end

  it { should have_css('h2', text: 'Log in') }
  it { should have_selector('h2.hdg') }

  describe 'allows login' do
    let(:user) { create(:user) }

    before do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    it { should have_content('Signed in successfully.') }
  end
end
