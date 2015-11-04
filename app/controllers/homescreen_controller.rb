class HomescreenController < ApplicationController
  before_filter :authenticate_user!

  def index
    @posts = Post.all
    @users = User.order('last_sign_in_at DESC')
  end
end
