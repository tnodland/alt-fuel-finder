require "rails_helper"

describe Station do
  let(:attrs) {
    {
      station_name: "Chili's",
      street_address: "123 main street",
      city: "Denver",
      state: "CO",
      zip: "80203",
      fuel_type_code: "BBQ",
      distance: 0.31422,
      access_days_time: "24 Hours Daily"
    }
  }

  subject { Station.new(attrs) }

  it "has attributes" do
    expect(subject).to be_a Station
    expect(subject.name).to eq "Chili's"
    expect(subject.address).to eq "123 main street, Denver, CO 80203"
    expect(subject.fuel_types).to eq "BBQ"
    expect(subject.distance).to eq 0.31422
    expect(subject.access_times).to eq "24 Hours Daily"

  end
end
