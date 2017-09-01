require 'rails_helper'

describe NrelStation do
  it "successfully initializes with valid attributes" do
    valid_attrs = {
      :access_days_time=>"24 hours daily",
      :fuel_type_code=>"ELEC",
      :station_name=>"UDR",
      :city=>"Denver",
      :state=>"CO",
      :street_address=>"800 Acoma St",
      :zip=>"80204",
      :distance=>0.31422
    }

    station = NrelStation.new(valid_attrs)

    expect(station.name).to eq("UDR")
    expect(station.fuel_type).to eq("ELEC")
    expect(station.distance).to eq(0.31422)
    expect(station.access_times).to eq("24 hours daily")
    expect(station.address).to eq("800 Acoma St, Denver, CO 80204")
  end
end
