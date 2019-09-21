class MakersController < ApplicationController
  def index
    @maker = Maker.all
  end

  def show
    @maker = Maker.find(params[:id])
    if params[:tag_name]
      @bikes = Bike.tagged_with("#{params[:tag_name]}")
    else
     @bikes = @maker.bikes
    end
  end
  
end
