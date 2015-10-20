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
    end

    describe "show" do
        # before do
        #     visit post_path
        # end

        # it { should have_selector('h1') }
    end

    describe "new" do
    end

    describe "edit" do
    end

    describe "destroy" do
    end
end