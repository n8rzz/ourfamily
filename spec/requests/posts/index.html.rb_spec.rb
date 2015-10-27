require 'rails_helper'

describe 'posts/index.html.erb', type: :view do
  let(:user) { create(:user) }

  before(:each) do
    sign_in(user)
    10.times do |n|
      FactoryGirl.create(:post, id: n)
    end
  end

  subject { page }

  describe 'index' do
    before { visit posts_path }

    it { should render_template(:index) }
    it { should have_css('h1', text: 'OurFamily') }
    it { should have_css('h2', text: 'Recent Posts') }
    it { should have_selector('ul.vlist') }
  end
end
