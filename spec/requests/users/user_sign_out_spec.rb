require 'rails_helper'

describe 'user logout' do
  subject { page }
  let(:user) { create(:user) }

  before { sign_in user }

  it 'allows the user to logout' do
    sign_out_user

    should have_content('You need to sign in or sign up before continuing.')
  end
end
