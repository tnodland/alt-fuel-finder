class StationSearch
  def initialize(zip)
    @zip = zip
  end

  def stations
    raw_stations.map do |raw_station|
      Station.new(raw_station)
    end
  end

  private
    attr_reader :zip

    def raw_search
      @raw_search ||= NrelService.new(zip).station_search
    end

    def raw_stations
      raw_search[:fuel_stations]
    end
end
