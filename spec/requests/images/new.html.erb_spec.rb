require 'rails_helper'

describe 'images/new.html.erb', type: :view do
  subject { page }
  let(:user) { create(:user) }

  describe 'when signed in' do
    before :each do
      sign_in(user)
      visit new_image_path
    end

    it { should render_template :new }
    it { should have_css('h2', text: 'Add New Image to Gallery') }
    it { should have_selector('#image_name') }
    it { should have_selector('#image_description') }
    it { should have_selector('input[type="submit"]') }
    it { should have_selector('input[type="file"]') }
    it { should have_selector('input[value="Add Image"]') }

    describe 'invalid information' do
      it 'should not create an image' do
        expect { click_button 'Add Image' }.not_to change(Image, :count)
      end

      describe 'error messages' do
        before { click_button 'Add Image' }

        it { should have_content('error') }
      end
    end
  end
end
