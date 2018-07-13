class SearchController < ApplicationController
  def index
    @station_search = StationSearch.new(params[:q])
  end
end

