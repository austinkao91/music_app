class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :login_user!, :current_user, :logged_in_user



  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    unless logged_in?
      flash[:errors] = ["Please log in"]
      redirect_to new_session_url
    end
  end

  def login_user!

    if @user
      if @user.is_password?(user_params[:password])
        @user.reset_session_token!
        session[:session_token] = @user.session_token
        @user.save
        redirect_to user_url(current_user)
      else
        flash.now["errors"] = ["Invalid password!"]
        render :new
      end
    else
      flash.now["errors"] = ["User does not exist!"]
      redirect_to new_user_url
    end
  end
end
