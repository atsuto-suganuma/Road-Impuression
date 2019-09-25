class Admin::MakersController < ApplicationController
before_action :authenticate_admin!
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

  def show
    @maker = Maker.find(params[:id])
    if params[:tag_name]
      @bikes = Bike.tagged_with("#{params[:tag_name]}")
    else
     @bikes = @maker.bikes.page(params[:page]).per(30)
    end
  end
  def edit
    @maker = Maker.find(params[:id])
  end

  def update
    @maker = Maker.find(params[:id])
    if @maker.update(maker_params)
       redirect_to admin_maker_path(@maker.id)
    else
      render :edit
    end
  end

  def destroy
    @maker = Maker.find(params[:id])
    @maker.destroy
    redirect_to admin_makers_path
  end

  private

  def maker_params
    params.require(:maker).permit(:maker_name, :maker_image, :country, :body)
  end
end
