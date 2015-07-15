class UsersController < ApplicationController

  before_action :require_log_in, only: :dashboard
  def new
    @user = User.new
    @states = State.all
    @locations = Location.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to users_dashboard_url
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
