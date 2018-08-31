class SearchPresenter
  def initialize(zip)
    @zip = zip
  end

  def stations
    service.fuel_stations.map do |station_data|
      Station.new(station_data)
    end
  end

  private
  attr_reader :zip

  def service
    NrelService.new(zip)
  end
end
