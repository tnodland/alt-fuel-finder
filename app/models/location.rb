class Location
  attr_reader :name


  def initialize(data)
    @name = data[:station_name]
    @city = data[:city]
    @street_address = data[:street_address]
    @state = data[:state]
    @zip = data[:zip]
    @fuel_type_code = data[:fuel_type_code]
    @distance = data[:distance]
    @times = data[:access_days_time]
  end

  def address
    "#{@street_address}, #{@city} #{@state}, #{@zip}"
  end

  def fuel_type
    if @fuel_type_code == "ELEC"
      "Electric"
    else
      "Plain ol' Gasoline"
    end
  end

  def distance
    "#{@distance} Miles"
  end

  def times
    if @times.include? "Not Specified"
      "Call To find hours of availability"
    else
      @times
    end
  end
end
