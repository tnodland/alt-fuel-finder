require "spec_helper"
require "./app/models/station"

describe Station do
  let(:attrs) { 
    {
      station_name: "UDR",
      street_address: "800 Acoma St",
      city: "Denver",
      state: "CO",
      zip: "80204",
      fuel_type_code: "ELEC",
      distance: 0.31422,
      access_days_time: "24 hours daily"
    }
  }

  subject { Station.new(attrs) }

  it "exists" do
    expect(subject).to be_a Station
    expect(subject.name).to eq ("UDR")
    expect(subject.address).to eq ("800 Acoma St, Denver, CO 80204")
    expect(subject.fuel_types).to eq ("ELEC")
    expect(subject.distance).to eq (0.31422)
    expect(subject.access_times).to eq ("24 hours daily")
  end
end
