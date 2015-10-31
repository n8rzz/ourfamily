require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #show' do
    let(:post) { create(:post) }

    it 'assigns the requested post to @post' do
      get :show, id: post
      expect(post).to be_instance_of(Post)
    end

    describe 'renders the #index view' do
      before do
        sign_in(user)
        get :show, id: post
      end

      it { should render_template(:show) }
    end
  end

  describe 'POST create' do
    before(:each) { sign_in(create(:user)) }

    context 'with valid attributes' do
      it 'creates a new post' do
        expect do
          post :create, post: attributes_for(:post)
        end.to change(Post, :count).by(1)
      end

      it 'redirects to the new post' do
        post :create, post: attributes_for(:post)
        expect { (response).to redirect_to(root_url) }
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new post' do
        expect do
          post :create, post: attributes_for(:invalid_post)
        end.to_not change(Post, :count)
      end

      it 're-renders the new method' do
        post :create, post: attributes_for(:invalid_post)
        expect { (response).to render_template :new }
      end
    end
  end

  describe 'PUT update' do
    before :each do
      sign_in(create(:user))
      @post = create(:post, title: 'Sound as a pound', body: 'No, no, no, no, no.  Danger\'s my middle name')
    end

    context 'valid attributes' do
      it 'located the requested @post' do
        put :update, id: @post, post: attributes_for(:post)
        expect { assigns(:post).to eq(@post) }
      end

      it 'changes the @post\'s attributes' do
        put :update, id: @post, post: attributes_for(:post, title: 'lucky charms', body: 'This is candy')
        @post.reload
        expect { (@post.title).to eq('lucky charms') }
        expect { (@post.body).to eq('This is candy') }
      end

      it 'redirects to the posts list' do
        put :update, id: @post, post: attributes_for(:post)
        expect(response).to redirect_to @post
      end
    end

    context 'invalid attributes' do
      it 'locates the requested @post' do
        put :update, id: @post, post: attributes_for(:invalid_post)
        expect { assigns(:post).to eq(@post) }
      end

      it 'does not change @post\'s attributes' do
        put :update, id: @post, post: attributes_for(:post, title: 'A title', body: nil)
        @post.reload
        expect { (@post.title).to_not eq('A title') }
        expect { (@post.body).to_not eq('MyText') }
      end

      it 're-renders the edit method' do
        put :update, id: @post, post: attributes_for(:invalid_post)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      sign_in(create(:user))
      @post = create(:post)
    end

    it 'deletes the post' do
      expect do
        delete :destroy, id: @post
      end.to change(Post, :count).by(-1)
    end

    it 'redirects to posts#index' do
      delete :destroy, id: @post
      expect(response).to redirect_to(root_url)
    end
  end
end
