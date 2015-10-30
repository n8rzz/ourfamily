class HomescreenController < ApplicationController
  def index
    @posts = Post.all
    @users = User.order('last_sign_in_at DESC')
  end
end
