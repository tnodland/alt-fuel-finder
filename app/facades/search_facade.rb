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

  end
end
