require 'rails_helper'

describe 'user logout' do
  subject { page }

  let(:user) { create(:user) }

  before do
    visit root_path
    sign_in user
  end

  it 'allows the user to logout' do
    sign_out_user

    should have_content('Signed out successfully.')
  end
end
