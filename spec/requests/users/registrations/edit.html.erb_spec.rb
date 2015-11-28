require 'rails_helper'

describe 'devise/registrations/edit.html.erb', type: :view do
  let(:user) { create(:user) }
  subject { page }

  before do
    sign_in(user)
    visit edit_user_registration_path
  end

  it { should have_css('h2', text: 'Edit Profile') }
  it { should have_selector('h2.hdg') }
  it { should have_selector('input#user_first_name') }
  it { should have_selector('input#user_last_name') }
  it { should have_selector('input#user_birthday') }
  it { should have_selector('input#user_email') }
  it { should have_selector('input#user_current_password') }
  it { should have_css('h3', text: 'Change Your Password') }
  it { should have_selector('input#user_password') }
  it { should have_selector('input#user_password_confirmation') }
  it { should have_selector('input[type=submit][value="Update"]') }
end
