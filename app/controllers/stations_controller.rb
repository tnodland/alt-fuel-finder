class StationsController < ApplicationController
  def show
    @station_facade = StationFacade.new(params[:id])
  end
end
