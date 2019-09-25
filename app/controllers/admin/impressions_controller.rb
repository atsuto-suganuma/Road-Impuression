class Admin::ImpressionsController < ApplicationController
	before_action :authenticate_admin!
  def destroy
  	@impression = Impression.find(params[:id])
  	@bike = @impression.bike
  	@impression.destroy
  	redirect_to admin_maker_bike_show_path(@bike.id,@bike.maker)
  end
end
