require 'rails_helper'

describe 'posts/index.html.erb', type: :view do
  let(:user) { create(:user) }
  let(:post) { create(:post, id: 2, created_at: 4.days.ago, user_id: user.id) }
  let!(:older_post) { create(:post, id: 3, created_at: 8.days.ago, user_id: user.id) }
  let!(:newer_post) { create(:post, id: 1, created_at: 2.days.ago, user_id: user.id) }

  subject { page }

  before do
    sign_in(user)
    visit posts_path
  end

  it { should render_template(:index) }
  it { should have_css('h1', text: 'OurFamily') }
  it { should have_css('h2', text: 'Recent Posts') }
  it { should have_selector('ul.vlist') }
  it { should have_css('div', text: 'ago') }
  it { should have_css('div', text: post.user.email) }
end
