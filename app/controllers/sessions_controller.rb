class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username_and_password(
      params[:user][:username_or_email],
      params[:user][:password])
    if !user
      user = User.find_by_email_and_password(
        params[:user][:username_or_email],
        params[:user][:password])
    end

    if user
      log_in(user)
      redirect_to root
    else
      flash.now[:errors] = ['Sorry, that username or password is incorrect']
      render :new
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end

end
