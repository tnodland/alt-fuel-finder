class SearchFacade
  def initialize(zip)
    @zip = zip
  end

  def total_results
    service = DevnetService.new
  end
end
