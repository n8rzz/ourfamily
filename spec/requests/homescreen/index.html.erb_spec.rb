require 'rails_helper'

describe 'homescreen#index.html.erb', type: :view do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  subject { page }

  before do
    sign_in(user)
    visit root_path
  end

  it { should render_template(:index) }
  it { should have_css('h1', text: 'OurFamily') }
  it { should have_css('h2', text: 'Recent Posts') }
  it { should have_selector('ul.vlist') }
  # it { should have_css('div', text: 'ago') }
  # it { should have_css('div', text: post.user.email) }
  # it { should have_css('div', text: '{EDIT}') }
end
