class SearchController < ApplicationController
  def index
    @presenter = StationSearchPresenter.new(params[:q])
  end
end

