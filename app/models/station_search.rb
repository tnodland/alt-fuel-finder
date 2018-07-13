class StationSearch
  def initialize(zip)
    @zip = zip
  end

  def stations
    service = NrelStationService.new
    raw_data = service.stations({location: zip})
    raw_data[:fuel_stations].map do |raw_station|
      Station.new(raw_station)
    end



    # response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=lK3Ezk2mSCoz7TIleZ7aIWYAdT2vKVd5qXrbE9q0&location=#{zip}&radius=6.0&fuel_type=ELEC,LPG&limit=10")
    # raw_data = JSON.parse(response.body, symbolize_names: true)
    # raw_data[:fuel_stations].map do |raw_station|
    #   Station.new(raw_station)
    # end
  end

  private
    attr_reader :zip
end

