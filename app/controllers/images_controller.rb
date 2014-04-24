class ImagesController < ApplicationController
  before_filter :set_image, only: [:show, :edit, :update]

  def index
    @images = Image.includes(:tags).order('id DESC')
  end

  def show
  end

  def create
    @image = Image.create(image_params)
    render @image
  end

  def edit
  end

  def update
    if @image.update(image_params)
      redirect_to images_url, notice: t('.two_hundred')
    else
      render :edit
    end
  end

  private
    def set_image
      @image = Image.where(id: params[:id]).includes(:tags).first
    end

    def image_params
      params.require(:image).permit(:title, :file, :tag_list)
    end
end