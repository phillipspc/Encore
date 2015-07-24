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

  def twittercreate
    auth = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
    UserLocale.create!({user_id: user.id, locale_id: 1})
    log_in(user)
    redirect_to root_url
  end

  def destroy
    if (current_user == User.find_by_username('guest'))
      current_user.refreshGuest!
      redirect_to root_url
    else
      log_out!
      redirect_to root_url
    end
  end

end
