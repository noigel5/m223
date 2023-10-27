class AdminController < ApplicationController
  before_action :require_admin, only: [:edit, :update, :destroy]

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
  
    if @user.update(user_params)
      flash[:alert] = "User updated successfully"
      redirect_to users_index_path
    else
      flash[:alert] = "User not updated"
      render :edit, status: :unprocessable_entity
    end
  end  

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, alert: 'User deleted'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :address, :telnr, :role)
  end

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "403 Forbidden"
    end
  end
end
