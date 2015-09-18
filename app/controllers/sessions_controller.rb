class SessionsController < ApplicationController
  include SessionsHelper
  def new
    render :new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    login_user!
  end

  def destroy
    current_user.reset_session_token!
    current_user.save!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
