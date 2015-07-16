
module Api
  class ArtistsController < ApiController

    def edit
      ArtistTracking.create!({
        artist_id: params[:id], user_id: current_user.id
        })
      render json: {}
    end

    def index
      @artists = Artist.all
      render :index
    end

    def show
      @artist = Artist.find(params[:id])
      render :show
    end

    def destroy
      ArtistTracking.find_by!({
        artist_id: params[:id], user_id: current_user.id
      }).destroy!

      render json: {}
    end

  end
end
