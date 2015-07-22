module Api
  class ConcertPhotosController < ApiController
    wrap_parameters false


    def create
      @concert_photo = ConcertPhoto.create!(concert_photo_params)
        # redirect_to "/#/concerts/#{params[:concert_id]}"
        render :show
    end


    private
    def concert_photo_params
      params.require(:concert_photo).permit(:photo, :concert_id)
    end

  end
end
