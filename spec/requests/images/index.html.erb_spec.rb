require 'rails_helper'

describe 'images#index.html.erb', type: :view do
  let(:user) { create(:user) }

  subject { page }

  before do
    # sign_in(user)
    visit gallery_path
  end

  describe 'when not signed in' do
    it { should_not render_template :index }
    # it { should redirect_to(new_user_session_path) }
    # it { should_not have_content('Recent Posts') }
    # it { should_not have_content('Member Activity') }
  end

  describe 'when signed in' do
    let(:image) { create(:image, user_id: user.id) }

    before { sign_in(user) }

    it { should render_template :index }
    it { should have_css('a', text: 'Add Image to Gallery') }
    it { should have_content(image.name) }
    it { should have_content(image.description) }
  end
end
