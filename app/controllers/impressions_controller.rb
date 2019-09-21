class ImpressionsController < ApplicationController

  def create
    bike = Bike.find(params[:id])
    impression = current_user.impressions.new(impression_params)
    impression.bike_id = bike.id
    if impression.save
       flash[:success] = "インプレッションを投稿しました。"
       redirect_back(fallback_location: root_url)
    else
       flash[:success] = "インプレッションの投稿ができませんでした。"
       redirect_back(fallback_location: root_url)
    end
  end

  def destroy
  	impression = Impression.find(params[:id])
  	if impression.destroy
  	   flash[:success] = "インプレッションを削除しました。"
       redirect_back(fallback_location: root_url)
    else
       flash[:success] = "インプレッションを削除できませんでした。"
       redirect_back(fallback_location: root_url)
  end
end

  def edit
    @impression = Impression.find(params[:id])
    @bike = Bike.find(params[:bike_id])
  end

  def update
    @impression = Impression.find(params[:id])
    @bike = @impression.bike
    @impression.update(impression_params)
    redirect_to maker_bike_show_path(@bike.maker_id,@bike.id,@impression.id)

  end

  def impression_params
  params.require(:impression).permit(:bike_id, :user_id, :impression_title, :impression_text, :satisfaction_level, :design_evaluation, :weight_evaluation, :rigidity_evaluation,:comfort_evaluation, :cp_evaluation, :created_at, :updated_at)
  end
end
