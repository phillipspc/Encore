module Api
  class LocalesController < ApiController

    def index
      @locales = Locale.all
      render :index
    end

    def show
      @locale = Locale.find(params[:id])
      render :show
    end

  end
end
