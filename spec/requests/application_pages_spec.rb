require 'rails_helper'

describe 'Application Pages' do
  subject { page }

  before do
    visit root_path
  end

  it { should have_selector('div.wrapper') }
  it { should have_selector('div.page') }
  it { should have_selector('div.page-hd') }
  it { should have_selector('div.page-bd') }
  it { should have_selector('div.page-ft') }

  describe 'when not signed in' do
    it { should have_css('a', text: 'Register') }
    it { should have_css('a', text: 'Login') }
    it { should_not have_css('a', text: 'Profile') }
    it { should_not have_selector('input[type=submit][value="Logout"]') }
  end

  describe 'when signed in' do
    let(:user) { create(:user) }
    before { sign_in user }

    it { should_not have_css('a', text: 'Register') }
    it { should_not have_css('a', text: 'Login') }
    it { should_not have_css('a', text: 'Posts') }
    it { should have_css('a', text: 'New Post') }
    it { should have_css('a', text: 'Gallery') }
    it { should have_css('a', text: 'Profile') }

    it { should have_selector('input[type=submit][value="Logout"]') }
  end
end
