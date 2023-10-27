class UsersController < ApplicationController
  before_action :require_admin, only: :index

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.user!
      flash[:alert] = "User created successfully"
      redirect_to users_path
    else
      flash[:alert] = "User not created"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      flash[:notice] = "Profile updated successfully"
      redirect_to pages_profile_path
    else
      flash[:alert] = "Profile not updated"
      render :edit, status: :unprocessable_entity
    end
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
