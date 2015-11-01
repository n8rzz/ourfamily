require 'rails_helper'

describe StaticPagesController, type: :controller do
  subject { page }
  before { visit root_path }

  it '#index' do
    get :index
    expect { (response).to render_template :index }
  end

  it 'should have correct page links'
end
