class MakersController < ApplicationController
  def index
    @makers = Maker.all
  end

  def show
    @maker = Maker.find(params[:id])
    if params[:tag_name]
      @bikes = Bike.tagged_with("#{params[:tag_name]}")
    else
     @bikes = @maker.bikes.page(params[:page]).per(30)
    end
  end
  
end
