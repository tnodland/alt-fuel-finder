class SearchController < ApplicationController
  def index
    @presenter = SearchPresenter.new(params[:q])
  end
end

