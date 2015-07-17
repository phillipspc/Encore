module Api
  class UserLocalesController < ApiController

    def create
      UserLocale.create!({
        locale_id: params[:locale_id], user_id: current_user.id
        })
      render json: {}
    end

    def destroy
      UserLocale.find_by!({
        locale_id: params[:locale_id], user_id: current_user.id
      }).destroy!
      render json: {}
    end


  end
end
