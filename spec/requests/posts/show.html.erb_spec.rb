require 'rails_helper'

describe 'posts/show.html.erb', type: :view do
  subject { page }

  let(:user) { create(:user) }
  let(:post) { create(:post, id: 2, created_at: 4.days.ago, user_id: user.id) }
  let!(:older_post) { create(:post, id: 3, created_at: 8.days.ago, user_id: user.id) }
  let!(:newer_post) { create(:post, id: 1, created_at: 2.days.ago, user_id: user.id) }

  describe 'when viewing users own post' do
    before(:each) do
      sign_in(user)
      visit post_path(post)
    end

    after(:each) do
      sign_out_user
    end

    it { should render_template(:show) }
    it { should have_css('h1', text: 'OurFamily') }
    it { should have_css('h2', text: post.title) }
    it { should have_css('li', text: time_ago_in_words(post.created_at)) }
    it { should have_css('div', text: post.user.name) }
    it { should have_css('div', text: post.body) }
    it { should have_css('a', text: 'New Post') }
    it { should have_css('a', text: 'Edit Post') }
    it { should have_selector('input[type=submit][value="Delete"]') }
    it { should have_content(user.name) }

    describe 'newest post' do
      before { visit post_path(newer_post) }

      it { should have_css('a', text: older_post.title) }
    end

    describe 'oldest post' do
      before { visit post_path(older_post) }

      it { should have_css('a', text: newer_post.title) }
    end
  end

  describe 'when viewing another users posts' do
    let(:otherUser) { create(:user, first_name: 'Bobby', last_name: 'Small', email: 'bobby@eample.com', id: 2) }

    before(:each) do
      sign_in(otherUser)
      visit post_path(post)
    end

    it { should_not have_css('a', text: 'Edit Post') }
    it { should_not have_selector('input[type=submit][value="Delete"]') }
  end
end
