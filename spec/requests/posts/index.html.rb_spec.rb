require 'rails_helper'

describe "posts/index.html.erb", type: :view do
    before(:all) { 10.times { FactoryGirl.create(:post) } }

    subject { page }

    describe "index" do
        before { visit posts_path }

        it { should have_css('h1', text: 'OurFamily') }
        it { should have_css('h2', text: 'Recent Posts') }
        it { should have_selector('ul.vlist') }
    end
end