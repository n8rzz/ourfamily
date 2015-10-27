require 'rails_helper'

describe 'posts/show.html.erb', type: :view do
  let(:user) { create(:user) }

  subject { page }

  before(:each) do
    sign_in(user)
  end

  describe 'show' do
    let(:post) { create(:post, id: 2, created_at: 4.days.ago) }
    let!(:older_post) { create(:post, id: 3, created_at: 8.days.ago) }
    let!(:newer_post) { create(:post, id: 1, created_at: 2.days.ago) }

    before { visit post_path(post) }

    it { should render_template(:show) }
    it { should have_css('h1', text: 'OurFamily') }
    it { should have_css('h2', text: post.title) }
    it { should have_css('h3', text: time_ago_in_words(post.created_at)) }
    it { should have_css('div', text: post.body) }
    it { should have_css('a', text: 'New Post') }
    it { should have_css('a', text: 'Edit Post') }
    # it { should have_css('a', text: 'Delete Post') }

    describe 'newest post' do
      before { visit post_path(newer_post) }

      it { should have_css('a', text: older_post.title) }
    end

    describe 'oldest post' do
      before { visit post_path(older_post) }

      it { should have_css('a', text: newer_post.title) }
    end
  end
end
