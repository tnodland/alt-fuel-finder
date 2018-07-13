class NrelStationService
  def stations(filter)
    params = default_params.merge(filter)
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json", params)
    raw_data = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov")
  end

  def default_params
    {
     api_key: ENV["NREL_API_KEY"],
     radius: "6.0",
     fuel_type: "ELEC,LPG",
     limit: "10"
    }
  end
end
