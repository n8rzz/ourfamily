require 'rails_helper'

describe ImagesController, type: :controller do
  let(:user) { create(:user) }

  # describe 'GET #index' do
  #   it 'populates an array of images'
  #   it 'renders the :index view'
  #   it 'returns http success' do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'GET #show' do
  #   it 'assigns the requested image to @image'
  #   it 'renders the :show template'
  #   it 'returns http success' do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'GET #new' do
    describe 'when not signed in' do
      before { get :create }

      it { should redirect_to(new_user_session_path) }
    end

    describe 'when a user is signed in' do
      before(:each) { sign_in(create(:user)) }

      it 'assigns new Image to @image' do
        image = create(:image)
        get :index
        expect { (assigns(:images)).to eq([image]) }
      end

      it 'renders the :index template' do
        get :index
        expect { (response).to render_template :index }
      end
    end
  end

  describe 'GET #new' do
    before(:each) { sign_in(create(:user)) }

    it 'renders the :new template' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST @create' do
    describe 'when not signed in' do
      before { get :create }

      it { should redirect_to(new_user_session_path) }
    end

    describe 'when a user is signed in' do
      before(:each) { sign_in(create(:user)) }

      context 'with valid attributes' do
        it 'creates a new image' do
          expect do
            post :create, image: attributes_for(:image)
          end.to change(Image, :count).by(1)
        end

        it 'redirects to the image gallery' do
          post :create, image: attributes_for(:image)
          expect { (response).to redirect_to(gallery_path) }
        end
      end

      context 'with invalid attributes' do
        it 'does not create a new image' do
          expect do
            post :create, image: attributes_for(:invalid_image)
          end.to_not change(Image, :count)
        end
        it 're-renders the :new template' do
          post :create, image: attributes_for(:invalid_image)
          expect { (response).to render_template :new }
        end
      end
    end
  end

  # describe 'GET #destroy' do
  #   it 'deletes the image'
  #   it 'redirects to homescreen'
  # end
end
