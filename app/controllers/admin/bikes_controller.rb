class Admin::BikesController < ApplicationController
  def new
  	@bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to admin_maker_bike_show_path(@bike.maker_id, @bike.id)
    else
      render :new
    end
  end

  def show
    @bike = Bike.find(params[:id])
    # @years_bike = @bike.years_bikes
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    if @bike.update(bike_params)
       redirect_to admin_maker_bike_show_path(@bike.maker_id, @bike.id)
    else
      render :edit
    end
  end

  def search_bike
    @bikes = Bike.tagged_with(params[:tag])
  end

  private

  def bike_params
    params.require(:bike).permit(:bike_name, :bike_name_kana, :bike_image, :bike_body, :tag_list, :genre, :grade, :maker_id)
  end
end
