module Api
  class LocaleSearchController < ApiController

    def locale_search
      @search_results = Locale.search_by_city_or_state(params[:query])
      render :locale_search
    end

  end
end
