require 'rails_helper'

describe ImagesController, type: :controller do
  describe 'GET #index' do
    it 'populates an array of images'
    it 'renders the :index view'
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested image to @image'
    it 'renders the :show template'
    it 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'assigns new Image to @image'
    it 'renders the :new template'
    it 'returns http success' do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST @create' do
    context 'with valid attributes' do
      it 'save the new image in the database'
      it 'redirects to the image gallery'
    end

    context 'with invalid attributes' do
      it 'does not save the new image in the database'
      it 're-renders the :new template'
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'locates the requested @image'
      it 'changes @image attributes'
      it 'redirects to updated image'
    end

    context 'with invalid attributes' do
      it 'does not change the @image attributes'
      it 're-renders to edit method'
    end
  end

  describe 'GET #destroy' do
    it 'deletes the image'
    it 'redirects to homescreen'
  end
end
