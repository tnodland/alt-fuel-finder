class SearchController < ApplicationController
  def index
    @search = StationSearch.new(params[:q])
  end
end
