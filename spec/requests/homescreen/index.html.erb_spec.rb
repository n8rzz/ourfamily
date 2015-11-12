require 'rails_helper'

describe 'homescreen#index.html.erb', type: :view do
  let(:user) { create(:user) }

  subject { page }

  before do
    # sign_in(user)
    visit home_path
  end

  it { should have_css('h1', text: 'OurFamily') }

  describe 'when not signed in' do
    # it { should redirect_to(root_path) }
    it { should have_css('a', text: 'Register') }
    it { should have_css('a', text: 'Login') }
    it { should_not have_css('a', text: 'Profile') }
    it { should_not have_selector('input[type=submit][value="Logout"]') }
    it { should_not have_content('Recent Posts') }
    it { should_not have_content('Member Activity') }
  end

  describe 'when signed in' do
    let(:post) { create(:post) }

    before { sign_in(user) }

    it { should_not have_css('a', text: 'Register') }
    it { should_not have_css('a', text: 'Login') }
    it { should have_css('a', text: 'Profile') }
    it { should have_selector('input[type=submit][value="Logout"]') }
    it { should have_content('Recent Posts') }
    it { should have_css('h2', text: 'Recent Posts') }
    it { should have_selector('ul.vlist') }
    it { should have_content('Member Activity') }
    it { should have_css('li', text: user.name) }
    # it { should have_css('div', text: 'ago') }
    # it { should have_css('a', text: 'Edit Post') }
  end
end
