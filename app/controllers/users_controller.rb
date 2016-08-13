class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    if current_user
      redirect_to root_path, notice: "You already logged in."
      return
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to articles_path, notice: "User successfully added."
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to articles_path,
        notice: "Updated user information successfully."
    else
      render "edit"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
