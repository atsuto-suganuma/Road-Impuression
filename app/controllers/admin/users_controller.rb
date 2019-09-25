class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    if params[:p].nil?
      @p = User.ransack
      @users = User.all
      else
      @p = User.ransack(search_params)
      @users = @p.result(distinct: true)
    end
  end

  def show
    @user = User.find(params[:id])
    @impressions = @user.impressions.page(params[:page]).per(10)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to admin_users_path
  end

      private
    def search_params
      params.require(:p).permit!
    end
end
