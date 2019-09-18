class MakersController < ApplicationController
  def index
    @maker = Maker.all
  end

  def show
    @maker = Maker.find(params[:id])
  end
  
end
