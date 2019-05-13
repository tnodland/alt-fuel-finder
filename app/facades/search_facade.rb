class SearchFacade
  def initialize(zip)
    @zip = zip.to_i
  end

  def total_results
    service = DevnetService.new(@zip)
    locations = service.get_locations
    locations[:total_results]
  end

  def fifteen_nearest
    service = DevnetService.new(@zip)
    locations = service.get_locations
    fifteen_locations = locations[:fuel_stations].take(15)
    locations.map do |location|
      Location.new(location)
    end
  end
end
