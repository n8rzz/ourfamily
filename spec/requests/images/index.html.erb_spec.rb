require 'rails_helper'

describe 'images#index.html.erb', type: :view do
  subject { page }

  before do
    visit gallery_path
  end

  describe 'when not signed in' do
    it { should_not render_template :index }
    it { should_not have_css('h2', text: 'Gallery') }
    it { should_not have_css('a', text: 'Add New Image to Gallery') }
  end

  describe 'when signed in' do
    let(:user) { create(:user) }
    let(:image) { create(:image, user_id: user.id) }

    before { sign_in(user) }

    it { should render_template :index }
    it { should have_css('h2', text: 'Gallery') }
    it { should have_css('a', text: 'Add New Image to Gallery') }
    it { should_not have_content(text: image.name) }
    it { should_not have_content(text: image.description) }
  end
end
