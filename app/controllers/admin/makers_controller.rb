class Admin::MakersController < ApplicationController
  def index
    @makers = Maker.all
  end

  def new
    @maker = Maker.new
  end
  
  def create
    @maker = Maker.new(maker_params)
    if @maker.save
      redirect_to admin_makers_path
    else
      render :new
    end
  end

  private

  def maker_params
    params.require(:maker).permit(:maker_name, :maker_image, :country, :body)
  end
end
