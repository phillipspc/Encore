module Api
  class SearchController < ApiController

    def search
      @search_results = Artist.search_by_name(params[:query])
      render :search
    end

    def locale_search
      @search_results = Locale.search_by_city_or_state(params[:query])
      render :locale_search
    end

  end
end
