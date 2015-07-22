module Api
  class ConcertsController < ApiController

    def index
      @concerts = Concert.all
      render :index
    end

    def show
      @concert = Concert.find(params[:id])
      render :show
    end

    def update
      @concert = Concert.find(params[:id])
      @concert.update(concert_params)
      render :show  
    end

    private
    def concert_params
      params.require(:concert).permit(:artist_id, :locale_id, :small_image_url, :date)
    end

  end

end
