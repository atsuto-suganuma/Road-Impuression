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
  	impression =Impression.find(params[:id])
  	if impression.destroy
  	   flash[:success] = "インプレッションを削除しました。"
       redirect_back(fallback_location: root_url)
    else
       flash[:success] = "インプレッションを削除できませんでした。"
       redirect_back(fallback_location: root_url)
  end
end

  def update
  	
  end

  def impression_params
  params.require(:impression).permit(:bike_id, :user_id, :impression_title, :impression_text, :design_evaluation, :weight_evaluation, :rigidity_evaluation,:comfort_evaluation, :cp_evaluation, :created_at, :updated_at)
  end
end
