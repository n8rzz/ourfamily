require 'rails_helper'

describe 'posts/index.html.erb', type: :view do
  let(:user) { create(:user) }

  subject { page }

  before :each do
    10.times do |n|
      FactoryGirl.create(:post, id: n)
    end

    sign_in(user)
    visit posts_path
  end

  it { should render_template(:index) }
  it { should have_css('h1', text: 'OurFamily') }
  it { should have_css('h2', text: 'Recent Posts') }
  it { should have_selector('ul.vlist') }
  it { should have_css('div', text: 'ago') }
  it { should have_css('div', text: '{AUTHOR}') }
end
