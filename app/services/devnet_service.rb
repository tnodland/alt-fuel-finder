class DevnetService
  def initialize(zip)
    @zip = zip
  end

  def get_locations
    response = conn.get
    locations = JSON.parse(response.body, symbolize_names: true)
  end

  private
    def conn
      @_conn ||= Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?radius=5.0&location=80206&access=public&fuel_type=ELEC,LPG&api_key=#{ENV["DEVNET_API_KEY"]}")
    end
end
