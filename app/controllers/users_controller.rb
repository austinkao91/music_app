class UsersController < ApplicationController
  include UsersHelper

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!
    else
      flash.now["errors"] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = current_user
    render :show
  end

end
