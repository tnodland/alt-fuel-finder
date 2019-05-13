class SearchFacade
  def initialize(zip)
    @zip = zip.to_i
  end

  def total_results
    locations = service.get_locations
    locations[:total_results]
  end

  def fifteen_nearest
    locations = service.get_locations
    fifteen_locations = locations[:fuel_stations].take(15)
    fifteen_locations.map do |location|
      Location.new(location)
    end
  end

  private

    def service
      @_service ||= DevnetService.new(@zip)
    end
end
