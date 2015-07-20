class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username_or_email(
      params[:user][:username_or_email],
      params[:user][:password])

    if user
      log_in(user)
      redirect_to root_url
    else
      flash.now[:errors] = ['Sorry, that username or password is incorrect']
      render :new
    end
  end

  def destroy
    log_out!
    redirect_to root_url
  end

end
