class NrelStationService
  def initialize(station_id)
    @station_id = station_id
  end

  def data
    station_data = JSON.parse(response.body, symbolize_names: true)
  end

  def response
    conn.get("/api/alt-fuel-stations/v1/#{@station_id}.json", default_params)
  end

  private

  def conn
    Faraday.new(url: "https://developer.nrel.gov")
  end

  def default_params
    {
      api_key: ENV['NREL_API_KEY']
    }
  end
end
