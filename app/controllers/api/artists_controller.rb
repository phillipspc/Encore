module Api
  class ArtistsController < ApiController

    def show
      @artist = Artist.find(params[:id])
      render :show
    end

  end
end
