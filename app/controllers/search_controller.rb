class SearchController < ApplicationController
  def index
    @fuel_stations = NrelFuelStation.nearest_to_zip(params[:q])
  end
end

