module Api
  class ArtistTrackingsController < ApiController

    def create
      ArtistTracking.create!({
        artist_id: params[:artist_id], user_id: current_user.id
        })
      render json: {}
    end

    def destroy
      ArtistTracking.find_by!({
        artist_id: params[:artist_id], user_id: current_user.id
      }).destroy!
      render json: {}
    end
  end
end
