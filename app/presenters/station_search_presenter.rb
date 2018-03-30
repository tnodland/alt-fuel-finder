class StationSearchPresenter
  def initialize(zip)
    @zip = zip
  end

  def stations
    @stations = NrelApiService.new({location: zip}).stations.map do |raw_station|
      Station.new(raw_station)
    end
  end

  private
    attr_reader :zip
end

