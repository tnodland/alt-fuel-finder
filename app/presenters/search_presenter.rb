class SearchPresenter
  def initialize(zip)
  end

  def stations
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_API_KEY"]}&location=80203&limit=10&fuel_type=ELEC,LPG&radius=6.0")
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations].map do |station_data|
      Station.new(station_data)
    end
  end
end
