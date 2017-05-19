class NrelService

  def initialize
    @connection = Faraday.new("https://developer.nrel.gov/") do |faraday|
      # Needed to add this line to get the block approach to work
      faraday.adapter  Faraday.default_adapter
      faraday.params[:api_key] = "dy324cL59sWIyXQscvhCwjfUCOh3KgubuXRwSijm"
      faraday.params[:fuel_type] = "LPG,ELEC"
      faraday.params[:limit] = 10
      faraday.params[:radius] = 6
    end
  end

  def find_by_zip(zip)
    response = connection.get("api/alt-fuel-stations/v1/nearest.json", location: 80203)
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  private
    attr_reader :connection

end
