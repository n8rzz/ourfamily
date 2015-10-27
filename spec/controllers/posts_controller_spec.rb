require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    it 'populates an array of posts' do
      post = build(:post)
      get :index
      expect(post).to be_instance_of(Post)
    end

    describe 'renders the :index view' do
      before do
        sign_in(user)
        visit posts_path
      end

      it { should render_template('layouts/application') }
    end
  end

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
    # before do
    #   visit new_post_path
    # end

    # it { should render_template('new') }

    before(:each) { sign_in(create(:user)) }
    context 'with valid attributes' do
      it 'creates a new post' do
        expect{
          post :create, post: attributes_for(:post)
        }.to change(Post,:count).by(1)
      end

      it 'redirects to the new post' do
        post :create, post: attributes_for(:post)
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
