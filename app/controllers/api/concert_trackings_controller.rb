module Api
  class ConcertTrackingsController < ApiController

    def create
      ConcertTracking.create!({
        concert_id: params[:concert_id], user_id: current_user.id
        })
      render json: {}
    end

    def destroy
      ConcertTracking.find_by!({
        concert_id: params[:concert_id], user_id: current_user.id
      }).destroy!
      render json: {}
    end

  end
end
