class NrelService
  def self.nearest_to_zip(zip)
    response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?location=80203&api_key=#{ENV["NREL_API_KEY"]}&radius=6.0&limit=10&fuel_type=ELEC,LPG")
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end
end
