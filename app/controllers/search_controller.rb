class SearchController < ApplicationController
  def index
    @stations = NrelStation.search(search_filter)
  end

  private
    def search_filter
      { zip: params[:q] }
    end
end

