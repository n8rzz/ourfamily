require 'rails_helper'

describe "posts/new.html.erb", type: :view do
    subject { page }

    before { visit new_post_path }

    it { should render_template(:new) }
    it { should have_css('h2', text: 'New Post') }
    it { should have_selector('#post_title') }
    it { should have_selector('#post_body') }
    it { should have_selector('input[type="submit"]') }
    it { should have_selector('input[value="Add New Post"]') }

    describe "invalid information" do
        it "should not create a post" do
            expect { click_button "Add New Post" }.not_to change(Post, :count)
        end

        describe "error messages" do
            before { click_button "Add New Post" }
            it { should have_content('error') }
        end
    end
end
