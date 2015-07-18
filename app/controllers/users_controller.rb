class UsersController < ApplicationController

  def new
    @user = User.new
    @states = State.all
    @locales = Locale.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
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
