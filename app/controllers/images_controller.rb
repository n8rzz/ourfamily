class ImagesController < ApplicationController
  before_filter :authenticate_user!
  before_action :correct_user, only: [:destroy, :edit]

  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      flash[:success] = 'New Image Added!'
      redirect_to gallery_path
    else
      render 'new'
    end
  end

  def destroy
    Image.find(params[:id]).destroy
    flash[:success] = 'Image Deleted'
    redirect_to gallery_path
  end

  private

  def image_params
    params.require(:image).permit(:name, :description, :attachment)
  end

  def correct_user
    @image = current_user.images.find_by(id: params[:id])
    redirect_to root_url if @image.nil?
  end
end
