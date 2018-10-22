class StationDecorator < SimpleDelegator
  def name
    station_data[:alt_fuel_station][:station_name]
  end

  def status
    status_code = station_data[:alt_fuel_station][:status_code]
    statuses[status_code]
  end

  private

  def station_data
    @station_data ||= NrelStationService.new(nrel_id).data
  end

  def statuses
    {
      "E" => "This station is currently open."
    }
  end
end
