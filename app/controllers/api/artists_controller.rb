
module Api
  class ArtistsController < ApiController

    def index
      @artists = Artist.all
      render :index
    end

    def show
      @artist = Artist.find(params[:id])
      render :show
    end


    def update
      @artist = Artist.find(params[:id])
      @artist.update(artist_params)
      render :show
    end

    private
    def artist_params
      params.require(:artist).permit(:name, :description, :image_url, :small_image_url)
    end
  end
end
