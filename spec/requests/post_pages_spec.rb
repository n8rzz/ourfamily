require 'rails_helper'

describe "Post Pages" do

    subject { page }

    describe "index" do
        before do
            visit root_path
        end

        it { should have_title('OurFamily') }
        # it { should have_content('Recent Posts') }
        it { should have_selector('h2', 'Recent Posts') }
        it { should have_selector('ul.vlist') }
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