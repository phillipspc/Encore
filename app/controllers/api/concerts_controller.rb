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

  end

end
