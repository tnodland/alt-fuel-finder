class Station
  attr_reader :name, :fuel_types, :access_times, :distance

  def initialize(attrs = {})
    @name = attrs[:station_name]
    @street_address = attrs[:street_address]
    @city = attrs[:city]
    @state = attrs[:state]
    @zip = attrs[:zip]
    @fuel_types = attrs[:fuel_type_code]
    @access_times = attrs[:access_days_time]
    @distance = attrs[:distance]
  end

  def address
    "#{street_address} #{city}, #{state} #{zip}"
  end

  def self.find_by_zip(zip_code)
    raw_stations = NrelService.new.find_by_zip(zip_code)

    raw_stations.map do |raw_station|
      Station.new(raw_station)
    end
  end

  private
    attr_reader :street_address, :city, :state, :zip
end
