class BikeFavoritesController < ApplicationController

  def create
    bike = Bike.find(params[:bike_id])
    bike_favorite = current_user.bike_favorites.new(bike_id: bike.id)
    bike_favorite.save
    render json: bike.id
  end

  def destroy
    bike = Bike.find(params[:bike_id])
    bike_favorite = current_user.bike_favorites.find_by(bike_id: bike.id)
    bike_favorite.destroy
    render json: bike.id
  end
  
end
