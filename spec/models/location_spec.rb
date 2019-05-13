require 'rails_helper'

RSpec.describe Location do
  it "has attributes" do
    attributes = {
      station_name: "Fuel place",
      city: "Denver",
      street_address: "1234 Street St",
      state: "CO",
      zip: "80206",
      fuel_type_code: "ELEC",
      distance: 0.521,
      access_days_time: "24 hours daily"
    }

    location = Location.new(attributes)
    expect(location.name).to eq("Fuel place")
    expect(location.address).to eq("1234 Street St, Denver CO, 80206")
    expect(location.fuel_type).to eq("Electric")
    expect(location.distance).to eq("0.521 Miles")
    expect(location.times).to eq("24 hours daily")
  end
end
