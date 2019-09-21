class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_search

  def set_search
    if params[:q].nil?
      @q = Bike.ransack
    else
      @q = Bike.includes(:maker, :years_bikes).ransack(search_params)
    end
      @bikes = @q.result(distinct: true)
  end

    private
    def search_params
      params.require(:q).permit!
    end
end

