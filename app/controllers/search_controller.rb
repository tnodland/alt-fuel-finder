class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?location=80203&api_key=#{ENV["NREL_API_KEY"]}&radius=6.0&limit=10&fuel_type=ELEC,LPG")
    @fuel_stations = JSON.parse(response.body)["fuel_stations"].map do |raw_station|
      NrelFuelStation.new(raw_station)
    end
    # @fuel_stations = NrelFuelStation.nearest_to_zip(params[:q])
  end
end

class NrelFuelStation
  attr_reader :fuel_type, :name, :address, :distance, :hours

  def initialize(attrs = {})
  end
end
