class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to users_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    login_id = current_user.id
    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else render :edit
    end
  end
  
  def withdraw
    
  end

  def unsubscride
    
  end

  def destroy
  	@user = User.find(params[:id])
    @user.destroy
    redirect_to unsubscride_path
  end

private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email)
  end

end
