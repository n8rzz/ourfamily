require 'rails_helper'

describe 'images/show.html.erb', type: :view do
  subject { page }
  let(:user) { create(:user) }
  let(:image) { create(:image, user_id: user.id) }

  describe 'when viewing users own image' do
    before(:each) do
      sign_in(user)
      visit image_path(image.id)
    end

    after(:each) do
      sign_out_user
    end

    it { should render_template :show }
    it { should have_css('a', text: 'Back to Gallery') }
    it { should have_css('h2', text: image.name) }
    # it { should have_selector('image') }
    it { should have_css('div', text: image.user.name) }
    it { should have_css('div', text: image.description) }
    it { should have_selector('input[type=submit][value="Delete"]') }
  end

  describe 'when viewing another users image' do
    let(:otherUser) { create(:user, first_name: 'Bobby', last_name: 'Small', email: 'bobby@eample.com', id: 2) }

    before(:each) do
      sign_in(otherUser)
      visit image_path(image.id)
    end

    # it { should_not have_css('a', text: 'Edit Post') }
    it { should_not have_selector('input[type=submit][value="Delete"]') }
  end
end
