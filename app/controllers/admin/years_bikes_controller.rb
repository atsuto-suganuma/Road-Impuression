class Admin::YearsBikesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @years_bike = YearsBike.new
    @years_bike.years_bike_images.build
    @bike = Bike.find(params[:bike_id])
  end

  def create
    @years_bike = YearsBike.new(years_bike_params)
    @bike = @years_bike.bike
    p @years_bike
    if @years_bike.save
      redirect_to admin_maker_bike_show_path(@bike.maker_id,@bike.id)
    else
      render :new
    end
  end

  def edit
  	@years_bike = YearsBike.find(params[:id])
  end

  def update
    @years_bike = YearsBike.find(params[:id])
    @bike = @years_bike.bike
    if @years_bike.update(years_bike_params)
       redirect_to admin_maker_bike_show_path(@bike.maker_id,@bike.id)
    else
      render :edit
    end
  end

  def destroy
    @years_bike = YearsBike.find(params[:id])
    @bike = @years_bike.bike
    @years_bike.destroy
    redirect_to admin_maker_bike_show_path(@bike.maker_id,@bike.id)
  end

private

  def years_bike_params
        params.require(:years_bike).permit(:bike_id, :year_bike_body, :year,
        years_bike_images_attributes: [:id, :image, :display_order, :_destroy])
  end
end
