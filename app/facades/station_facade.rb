class StationFacade
  extend Forwardable

  def_delegators :station_decorator, :name, :status, :convenience_store?

  def initialize(id)
    @id = id
  end

  def current_weather
    "70º F"
  end

  private

  def station_decorator
    StationDecorator.new(station)
  end

  def station
    @station ||= Station.find(@id)
  end
end
