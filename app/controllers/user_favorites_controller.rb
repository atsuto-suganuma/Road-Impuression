class UserFavoritesController < ApplicationController

  def create
    impression = Impression.find(params[:impression_id])
    user_favorite = current_user.user_favorites.new(impression_id: impression.id)
    user_favorite.save
    render json: impression.id
  end

  def destroy
    impression = Impression.find(params[:impression_id])
    user_favorite = current_user.bike_favorites.find_by(impression_id: impression.id)
    user_favorite.destroy
    render json: impression.id
  end
  
end
end
