require 'rails_helper'

describe HomescreenController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user) }
    before { sign_in(user) }

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
