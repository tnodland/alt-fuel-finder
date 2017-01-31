class NrelFuelStation
  attr_reader :fuel_type, :name, :distance, :hours

  def initialize(attrs = {})
    @fuel_type = attrs[:fuel_type_code]
    @name = attrs[:station_name]
    @distance = attrs[:distance]
    @hours = attrs[:access_days_time]
    @attrs = attrs
  end

  def address
    "#{@attrs[:street_address]}, #{@attrs[:city]}, #{@attrs[:state]}"
  end

  def self.nearest_to_zip(zip)
    NrelService.nearest_to_zip(zip).map do |raw_station|
      new(raw_station)
    end
  end
end
