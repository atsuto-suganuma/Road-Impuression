class Admin::BikesController < ApplicationController
  def new
  	@bike = Bike.new
    @bike.bike_images.build
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to admin_maker_bikes_path(maker.id),(bike.id)
    else
      render :new
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:bike_name, :bike_body, :tag_list, :maker_id,
      bike_images_attributes: [:id, :image, :display_order, :_destroy]
      )
  end
end
