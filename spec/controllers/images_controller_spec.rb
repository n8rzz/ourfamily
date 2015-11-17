require 'rails_helper'

describe ImagesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    describe 'when not signed in' do
      before { get :index }

      it { should redirect_to(new_user_session_path) }
    end

    describe 'when a user is signed in' do
      before(:each) { sign_in user }

      it 'assigns new Image to @image' do
        image = create(:image)
        get :index
        expect { (assigns(:images)).to eq([image]) }
      end

      it 'renders the :index template' do
        get :index
        expect { (response).to render_template :index }
      end

      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET #show' do
    let(:image) { create(:image) }

    describe 'when not signed in' do
      before { get :show, id: image }

      it { should redirect_to(new_user_session_path) }
    end

    describe 'when a user is signed in' do
      before(:each) do
        sign_in user
        get :show, id: image
      end

      it 'assigns the requested image to @image' do
        expect(image).to be_instance_of(Image)
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'GET #new' do
    describe 'when not signed in' do
      before { get :new }

      it { should redirect_to(new_user_session_path) }
    end

    describe 'when a user is signed in' do
      before(:each) do
        sign_in user
        get :new
      end

      it 'renders the :new template' do
        expect(response).to render_template :new
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST @create' do
    describe 'when not signed in' do
      before { get :create }

      it { should redirect_to(new_user_session_path) }
    end

    describe 'when a user is signed in' do
      before(:each) do
        sign_in user
      end

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
          expect(response).to render_template :new
        end
      end
    end
  end

  describe 'GET #destroy' do
    describe 'when not signed in' do
      before do
        @image = create(:image)
      end

      it 'does not delete the image' do
        expect do
          delete :destroy, id: @image
        end.to change(Image, :count).by(0)
      end
    end

    describe 'when a user is signed in' do
      before(:each) do
        sign_in user
        @image = create(:image, user_id: user.id)
      end

      it 'deletes the image' do
        expect do
          delete :destroy, id: @image
        end.to change(Image, :count).by(-1)
      end

      it 'redirects to :index template' do
        delete :destroy, id: @image
        expect(response).to redirect_to(gallery_path)
      end
    end
  end
end
