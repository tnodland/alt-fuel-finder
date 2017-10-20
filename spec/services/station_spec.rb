require 'rails_helper'

describe Station do
  it "exists" do
    valid_attributes = {
      station_name: "Bus Man",
      street_address: "1510 Blake Street",
      fuel_type_code: "ELEC",
      state: "CO",
      zip: "80203",
      city: "Denver",
      distance: 1.0,
      access_days_time: "24 Hours"
    }

    station = Station.new(valid_attributes)
    expect(station.name).to eq("Bus Man")
    expect(station.address).to eq("1510 Blake Street Denver, CO 80203")
    expect(station.fuel_types).to eq("ELEC")
    expect(station.distance).to eq(1.0)
    expect(station.access_times).to eq("24 Hours")
  end

  context ".filter_by_zip(zip)" do
    it "returns 10 station objects" do
      stations = Station.filter_by_zip("80203")
      expect(stations.count).to eq(10)
      expect(stations.first).to be_a(Station)
    end
  end
end
