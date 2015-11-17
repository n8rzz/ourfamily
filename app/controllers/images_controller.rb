class ImagesController < ApplicationController
  before_filter :authenticate_user!
  before_action :correct_user, only: [:destroy, :edit]

  def index
  end

  def show
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

  def update
  end

  def destroy
  end

  private

  def image_params
    params.require(:image).permit(:name, :description, :attachment)
  end
end
