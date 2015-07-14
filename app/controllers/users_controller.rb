class UsersController < ApplicationController

  def new

  end

  def create

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
