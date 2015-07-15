module Api
  class SessionsController < ApiController

    def show
      @user = current_user
      render :show
    end

  end
end
