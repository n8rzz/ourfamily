require 'rails_helper'

describe 'posts/edit.html.erb', type: :view do
  let(:post) { create(:post) }
  let(:user) { create(:user) }

  subject { page }

  before(:each) do
    sign_in(user)
    visit edit_post_path(post)
  end

  it { should render_template(:edit) }
  it { should have_css('h2', text: 'Edit Post') }
  it { should have_selector('#post_title') }
  it { should have_selector('#post_body') }
  it { should have_selector('input[type="file"]') }
  it { should have_selector('input[type="submit"]') }
  it { should have_selector('input[value="Update Post"]') }

  describe 'with invalid title' do
    let(:new_title) { '' }

    before do
      fill_in 'Title', with: new_title
      click_button 'Update Post'
    end

    it { should have_content('error') }
  end

  describe 'with invalid title' do
    let(:new_body) { '' }

    before do
      fill_in 'Body', with: new_body
      click_button 'Update Post'
    end

    it { should have_content('error') }
  end
end
