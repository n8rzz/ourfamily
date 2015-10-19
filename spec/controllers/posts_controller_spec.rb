require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end

    it "renders the create template" do
      get :create
      expect(response).to render_template("create")
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end

    it "renders the update template" do
      get :update
      expect(response).to render_template("update")
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :destroy
      expect(response).to render_template("destroy")
    end
  end
end
