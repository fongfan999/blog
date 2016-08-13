class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    # Returns the currently logged in user or nil if there isn't one
    def current_user
      return unless session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end

    # Make current_user available in templates as a helper
    helper_method :current_user

    # Filter method to enforce a login requirement
    # Apply as before_action on any controller you want to protect
    def authenticate_user!
      logged_in? || access_denied
    end

    # Predicate method to test for a loggin in user
    def logged_in?
      current_user.is_a? User
    end

    # Make logged_in? available in templates as a helper
    helper_method :logged_in?

    def access_denied
      redirect_to login_path, notice: "Please log in to continue"
      return false
    end
end
