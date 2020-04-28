class Api::V1::ImageController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    json_response({ message: 'Hello there'})
  end

  def create
    image_store = ImageStore.new(image_store_params)
    image_store.status = :requested

    if image_store.save
      @data = {
          success: true,
          message: 'Ride successfully requested.'
      # render json: image_store, status: :created, location: api_post_path(image_store)

      }
    else
      @data = {
          error: true,
          message: image_store.errors.full_messages
      # render json: @post.errors, status: :unprocessable_entity

      }

    end
    render json: @data
  end

  def update
    ImageStore.update(image_store_params)
    head :no_content
  end

  def destroy
    ImageStore.destroy
    head :no_content
  end



  private
  def image_store_params
    params.require(:store_image).permit(:first_name, :last_name, :image, :date)
  end

end
