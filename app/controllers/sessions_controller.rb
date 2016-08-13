class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to root_path, notice: "You already logged in."
    end
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login/password combination."
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "You successfully logged out."
  end
end
