require 'rails_helper'

describe 'user login' do
  subject { page }

  before do
    visit new_user_session_path
  end

  it { should have_css('h2', text: 'Log in') }
  it { should have_selector('h2.hdg') }

  describe 'allows login' do
    let(:user) { create(:user) }

    before { sign_in user }

    it { should have_content('Signed in successfully.') }
  end
end
