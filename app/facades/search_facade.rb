class SearchFacade
  def initialize(zip)
    @zip = zip.to_i
  end

  def total_results
    service = DevnetService.new(@zip)
  end
end
