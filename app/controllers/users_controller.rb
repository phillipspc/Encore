class UsersController < ApplicationController

  before_action :require_log_in, only: :dashboard
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to new_session_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def dashboard
  end

  def edit

  end

  def show

  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
