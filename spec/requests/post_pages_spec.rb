require 'rails_helper'

describe "Post Pages" do
    subject { page }

    describe "index" do
        let(:post) { FactoryGirl.create(:post) }

        before do
            visit root_path
        end

        it { should have_title('OurFamily') }
        it { should have_selector('h1', 'Recent Posts') }
        # it { should have_selector('div.excerpt') }
        # it { should have_selector('li', text: post.title) }
        # it { should have_selector('div.excerpt-hd') }
        # it { should have_selector('h2.hdg', :text => post.title) }
        # it { should have_selector('div.excerpt-bd', :text => post.body) }
        # it { should have_selector('div.excerpt-ft') }

    end

    describe "show" do
        # before do
        #     visit post_path
        # end

        # it { should have_selector('h1') }
    end

    describe "new" do
    end

    describe "create" do
    end

    describe "edit" do
    end

    describe "destroy" do
    end
end