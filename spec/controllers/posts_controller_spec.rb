require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#index' do
    before do
      visit posts_path
    end

    it { should render_template('index') }
  end

  describe '#show' do
  end

  describe '#new' do
    before do
      visit new_post_path
    end

    it { should render_template('new') }
  end
end
