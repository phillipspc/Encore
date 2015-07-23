module Api
  class SessionsController < ApiController

    def show
      @user = current_user
      render :show
    end

    def destroy
      log_out!
      redirect_to root_url
    end

  end
end
