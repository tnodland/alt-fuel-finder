class NrelService
  def initialize(zip)
    @zip = zip
    @conn = Faraday.new("http://developer.nrel.gov")
  end

  def station_search
    get_json("/api/alt-fuel-stations/v1/nearest.json")
  end

  private
    attr_reader :zip, :conn

    def get_json(url)
      response = conn.get(url, params)
      JSON.parse(response.body, symbolize_names: true)
    end

    def params
      {
        api_key: ENV["NREL_API_KEY"],
        location: zip,
        radius: 6.0,
        limit: 10,
        fuel_type: "ELEC,LPG"
      }
    end
end
