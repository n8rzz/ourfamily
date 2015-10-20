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
        it { should have_selector('ul.vlist') }
        it { should have_selector('li div.excerpt') }
        it { should have_selector('div.excerpt-hd h2.hdg', post.title) }
        it { should have_selector('div.excerpt-bd') }
        it { should have_selector('div.excerpt-ft') }

    end

    describe "show" do
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