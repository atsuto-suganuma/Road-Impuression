class BikesController < ApplicationController

  def show
    @bike = Bike.find(params[:id])
    @bike_id = @bike.id
    @years_bikes = @bike.years_bikes
    @impression = Impression.new
    @impressions = @bike.impressions.page(params[:page]).per(10)
    if @reviews.blank?
       @reviews = [@bike.impressions.average(:design_evaluation), @bike.impressions.average(:weight_evaluation), @bike.impressions.average(:rigidity_evaluation), @bike.impressions.average(:comfort_evaluation), @bike.impressions.average(:cp_evaluation)]
    else
    @reviews = [@bike.impressions.average(:design_evaluation).floor(1), @bike.impressions.average(:weight_evaluation).floor(1), @bike.impressions.average(:rigidity_evaluation).floor(1), @bike.impressions.average(:comfort_evaluation).floor(1), @bike.impressions.average(:cp_evaluation).floor(1)]
    @review = Impression.find_by(id: params[:id])
   end

    if params[:year]
    @recent_years_bikes = YearsBike.find_by(year: params[:year] )
    else
    @recent_years_bikes = YearsBike.find_by(year: @bike.years_bikes.maximum(:year))
  end

  end

  def search_bike
    if params[:tag_name]
       @bikes = Bike.tagged_with("#{params[:tag_name]}").page(params[:page]).per(50)
    elsif params[:q].nil?
      @bikes = Bike.page(params[:page]).per(50)
    else
       @q = Bike.includes(:maker, :years_bikes).ransack(search_params)
       @bikes = @q.result(distinct: true).page(params[:page]).per(50)
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
