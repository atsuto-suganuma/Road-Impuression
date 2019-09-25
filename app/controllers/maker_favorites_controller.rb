class MakerFavoritesController < ApplicationController

  def create
    maker = Maker.find(params[:maker_id])
    maker_favorite = current_user.maker_favorites.new(maker_id: maker.id)
    maker_favorite.save
    render json: maker.id
  end

  def destroy
    maker = Maker.find(params[:maker_id])
    maker_favorite = current_user.maker_favorites.find_by(maker_id: maker.id)
    maker_favorite.destroy
    render json: maker.id
  end

end
