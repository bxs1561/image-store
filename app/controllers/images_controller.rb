class ImagesController < ApplicationController
  def new
    @images = StoreImage.new
  end
  def index
    @image = StoreImage.all
  end
  def create
    @images= StoreImage.new(image_store_params)
    if @images.save
      redirect_to root_path, notice: "The resume #{@images.first_name} has been uploaded."
    else
      render 'new'
    end
  end

  def edit
    @images = StoreImage.find(params[:id])
  end

  def update
    @images = StoreImage.find(params[:id])

    if @images.update(image_store_params)
      redirect_to @images
    else
      render 'edit'
    end
  end

  def show
    @images = StoreImage.find(params[:id])
  end

  def destroy
    @images = StoreImage.find(params[:id])
    @images.destroy

    redirect_to images_path
    # redirect_to root_path
  end

  private
    def image_store_params
      params.require(:store_image).permit(:first_name, :last_name,:image, :date, :category)
      # params.require(:store_image).permit(:first_name, :last_name, :image, :date)

    end

end
