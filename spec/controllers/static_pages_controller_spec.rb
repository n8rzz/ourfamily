require 'rails_helper'

describe StaticPagesController, type: :controller do
  subject { page }
  before { visit root_path }

  describe 'GET #index' do
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
