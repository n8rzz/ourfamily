class PostsController < ApplicationController
  before_action :correct_user, only: :destroy

  def show
    @post = Post.find(params[:id])
    @newer = @post.newer
    @older = @post.older
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'New Post Added!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = 'Post Updated'
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = 'Post Deleted'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :published, :photo)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
