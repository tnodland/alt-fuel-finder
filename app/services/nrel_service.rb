class NrelService
  def initialize
    @conn = Faraday.new("https://developer.nrel.gov") do |faraday|
      faraday.adapter(Faraday.default_adapter)
    end
  end

  def default_parameters
    {
      api_key: ENV['NREL_API_KEY'],
      fuel_type: "ELEC,LPG",
      limit: 10,
      radius: "6.0"
    }
  end

  def stations_by_zip(zip)
    parameters = default_parameters.merge({location: zip})
    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json", parameters)
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  def self.stations_by_zip(zip)
    new.stations_by_zip(zip)
  end
end
