class BikesController < ApplicationController

  def show
    @bike = Bike.find(params[:id])
    @bike_id = @bike.id
    @years_bikes = @bike.years_bikes
    @user = User.find_by(id: params[:id])
    @impression = Impression.new
    @reviews = [Impression.average(:design_evaluation).floor(1), Impression.average(:weight_evaluation).floor(1), Impression.average(:rigidity_evaluation).floor(1), Impression.average(:comfort_evaluation).floor(1), Impression.average(:cp_evaluation).floor(1)]
    @review = Impression.find_by(id: params[:id])


    if params[:year]
    @recent_years_bikes = YearsBike.find_by(year: params[:year] )
    else
    @recent_years_bikes = YearsBike.find_by(year: @bike.years_bikes.maximum(:year))
end

  end

  def search_bike
    if params[:tag_name]
       @bikes = Bike.tagged_with("#{params[:tag_name]}")
    else
       @q = Bike.includes(:maker, :years_bikes).ransack(search_params)
       @bikes = @q.result(distinct: true)
    end
  end

   def search_genre
    @bikes = Bike.where(genre: params[:genre])
  end


private
  def search_params
    params.require(:q).permit!
  end

end
