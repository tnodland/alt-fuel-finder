class NrelStation
  attr_reader :name, :fuel_type, :distance, :access_times

  def initialize(attrs = {})
    @attrs = attrs
    @name = attrs[:station_name]
    @fuel_type = attrs[:fuel_type_code]
    @distance = attrs[:distance]
    @access_times = attrs[:access_days_time]
  end

  def address
    "#{attrs[:street_address]}, #{attrs[:city]}, #{attrs[:state]} #{attrs[:zip]}"
  end

  def self.search(filter)
    better_filter = {location: filter[:zip]}
    raw_stations = NrelService.find_stations(better_filter)

    raw_stations.map do |raw_station|
      NrelStation.new(raw_station)
    end
  end

  private
    attr_reader :attrs
end

