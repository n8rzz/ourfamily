require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#index' do
    before { visit posts_path }

    it { should render_template('index') }
  end

  describe '#show' do
    let(:post) { create(:post) }
    before { visit post_path(post) }

    it { should render_template('show') }

    it 'should assign post to @post' do
      get :show, id: post.id, title: post.title, body: post.body
      expect(assigns(:post)).to eq post
    end

    context 'if it has a photo attachment' do
      # let(:post) { create(:post_attachment) }

      # it 'should exst' do
      #   expect(post.photo.exists?).to eq(true)
      # end
    end
  end

  describe '#new' do
    before { visit new_post_path }

    it { should render_template('new') }
  end
end
