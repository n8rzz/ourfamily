require 'rails_helper'

describe "posts/show.html.erb", type: :view do
    subject { page }

    describe "show" do
        let(:post) { create(:post, created_at: 4.days.ago) }
        let!(:older_post) { create(:post, created_at: 5.days.ago) }
        let!(:newer_post) { create(:post, created_at: 3.days.ago) }

        before { visit post_path(post) }

        it { should render_template(:show) }
        it { should have_css('h1', text: 'OurFamily') }
        it { should have_css('h2', text: post.title) }
        it { should have_css('h3', text: time_ago_in_words(post.created_at)) }
        it { should have_css('div', text: post.body) }
        it { should have_css('a', text: 'New Post') }
        it { should have_css('a', text: 'Edit Post') }
        # it { should have_css('a', text: 'Delete Post') }
        it { should have_css('a', text: 'Previous Post') }
        it { should have_css('a', text: 'Next Post') }

        describe "newest post" do
            before { visit post_path(newer_post) }

            it { should_not have_css('a', text: 'Next Post') }
        end

        # describe "oldest post" do
        #     before { visit post_path(5) }

        #     it { should_not have_css('a', text: 'Next Post') }
        # end
    end
end