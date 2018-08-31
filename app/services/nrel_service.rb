class NrelService
  def initialize(zip)
    @zip = zip
  end

  def fuel_stations
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  private

  attr_reader :zip

  def response
    conn.get("/api/alt-fuel-stations/v1/nearest.json", params)
  end

  def params
    {
      api_key: ENV["NREL_API_KEY"],
      location: zip,
      limit: 10,
      fuel_type: "ELEC,LPG",
      radius: "6.0"
    }
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
