class HomescreenController < ApplicationController
  before_filter :authenticate_user!

  def index
    @posts = Post.all
    @users = User.order('last_seen DESC')
  end
end
