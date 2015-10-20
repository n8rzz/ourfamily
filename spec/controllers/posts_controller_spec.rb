require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "#index" do
    before do
      visit posts_path
    end

    it { should render_template("index") }
  end

  describe "#show" do
    # before do
    #   visit post_path
    # end

    # it { should render_template("show") }
  end

  describe "#new" do
    before do
      visit new_post_path
    end

    # it "returns http success" do
    #   get :new
    #   expect(response).to have_http_status(:success)
    # end

      it { should render_template("new") }
  end

  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create
  #     expect(response).to have_http_status(:success)
  #   end

  #   it "renders the create template" do
  #     get :create
  #     expect(response).to render_template("create")
  #   end
  # end

  # describe "GET #update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end

  #   it "renders the update template" do
  #     get :update
  #     expect(response).to render_template("update")
  #   end
  # end

  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end

  #   it "renders the show template" do
  #     get :destroy
  #     expect(response).to render_template("destroy")
  #   end
  # end
end
