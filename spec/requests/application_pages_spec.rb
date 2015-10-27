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
    # it { should redirect_to('/users/sign_in') }
    it { should have_css('a', text: 'Register') }
    it { should have_css('a', text: 'Login') }
    it { should_not have_selector('input[type=submit][value="Logout"]') }
    it { should_not have_content('Recent Posts') }
  end

  describe 'when signed in' do
    let(:user) { create(:user) }
    before { sign_in(user) }

    it { should have_selector('input[type=submit][value="Logout"]') }
    it { should_not have_css('a', text: 'Register') }
    it { should_not have_css('a', text: 'Login') }
    it { should have_content('Recent Posts') }
  end
end
