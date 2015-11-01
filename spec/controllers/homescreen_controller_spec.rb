require 'rails_helper'

describe HomescreenController, type: :controller do
  subject { page }

  describe 'GET #index' do
    let(:user) { create(:user) }
    before { sign_in(user) }

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the #index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
