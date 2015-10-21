require 'rails_helper'

describe "posts/show.html.erb", type: :view do
    subject { page }

    describe "show" do
        let(:post) { create(:post) }
        before(:all) { 5.times { FactoryGirl.create(:post) } }

        before { visit post_path(3) }

        it { should have_css('h1', text: 'OurFamily') }
        it { should have_css('h2', text: post.title) }
        it { should have_css('h3', text: time_ago_in_words(post.published)) }
        it { should have_css('div', text: post.body) }
        it { should have_css('a', text: 'New Post') }
        it { should have_css('a', text: 'Edit Post') }
        it { should have_css('a', text: 'Previous Post') }
        it { should have_css('a', text: 'Next Post') }

        describe "newest post should have link to previous post" do
            before { visit post_path(1) }

            it { should_not have_css('a', text: 'Previous Post') }
        end

        describe "oldest post should have link to next post" do
            before { visit post_path(5) }

            it { should_not have_css('a', text: 'Next Post') }
        end
    end
end