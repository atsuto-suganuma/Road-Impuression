class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search


  def set_search
    if params[:q].nil?
     @q = Bike.includes(:maker, :years_bikes).ransack
    else
      @q = Bike.includes(:maker, :years_bikes).ransack(search_params)
    end
      @bikes = @q.result(distinct: true)
  end



  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name
      ]
    )
  end

  private
    def search_params
      params.require(:q).permit!
    end

    def after_sign_in_path_for(resourse)
      case resourse
      when User
        root_path
      when Admin
        admin_users_path
      end
    end
end
