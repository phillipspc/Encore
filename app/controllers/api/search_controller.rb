module Api
  class SearchController < ApiController

    def search
      @search_results = Artist.search_by_name(params[:query])
      render :search
    end

  end
end
