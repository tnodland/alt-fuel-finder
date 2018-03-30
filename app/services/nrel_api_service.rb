class NrelApiService
  def initialize(attrs = {})
    @attrs = attrs
  end

  def stations
    @stations ||= station_data[:fuel_stations]
  end

  private
    attr_reader :attrs

    def conn
      @conn ||= Faraday.new(url: "https://developer.nrel.gov")
    end

    def station_data
      @station_data ||= get_json("/api/alt-fuel-stations/v1/nearest.json")
    end

    def get_json(url)
      @response ||= conn.get(url, default_params.merge(attrs))
      JSON.parse(@response.body, symbolize_names: true)
    end

    def default_params
      {
        api_key: ENV["NREL_API_KEY"],
        limit: 10,
        radius: 6.0,
        fuel_type: "ELEC,LPG"
      }
    end
end
