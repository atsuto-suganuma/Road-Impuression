class Admin::BikesController < ApplicationController
  before_action :authenticate_admin!
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
    @user = User.find_by(id: params[:id])
    @impressions = @bike.impressions.page(params[:page]).per(10)
   if @bike.impressions.blank?
      @reviews = [@bike.impressions.average(:design_evaluation).to_f, @bike.impressions.average(:weight_evaluation).to_f, @bike.impressions.average(:rigidity_evaluation).to_f, @bike.impressions.average(:comfort_evaluation).to_f, @bike.impressions.average(:cp_evaluation).to_f]
    else
      @reviews = [@bike.impressions.average(:design_evaluation).floor(1).to_f, @bike.impressions.average(:weight_evaluation).floor(1).to_f, @bike.impressions.average(:rigidity_evaluation).floor(1).to_f, @bike.impressions.average(:comfort_evaluation).floor(1).to_f, @bike.impressions.average(:cp_evaluation).floor(1).to_f]
  end
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

  def destroy
    @bike = Bike.find(params[:id])
    @maker = @bike.maker
    @bike.destroy
    redirect_to admin_maker_path(@maker)
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

  # def search_bike

  #   @bikes = Bike.tagged_with(params[:tag])
  # end

  private
    def search_params
      params.require(:q).permit!
    end

  def bike_params
    params.require(:bike).permit(:bike_name, :bike_name_kana, :bike_image, :bike_body, :tag_list, :genre, :grade, :maker_id)
  end
end
