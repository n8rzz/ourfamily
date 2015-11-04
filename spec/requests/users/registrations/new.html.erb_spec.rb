require 'rails_helper'

describe 'devise/registrations/new.html.erb', type: :view do
  subject { page }

  before { visit new_user_registration_path }

  it { should have_css('h2', text: 'Create a new account') }
  it { should have_selector('h2.hdg') }
  it { should have_selector('input#user_first_name') }
  it { should have_selector('input#user_last_name') }
  it { should have_selector('input#user_birthday') }
  it { should have_selector('input#user_email') }
  it { should have_selector('input#user_password') }
  it { should have_selector('input#user_password_confirmation') }
  it { should have_selector('input[type=submit][value="Sign up"]') }
end
