require 'rails_helper'

describe NrelService do
  subject { NrelService.new("80203") }

  it "exists" do
    expect(subject).to be_an NrelService
  end

  context "instance methods" do
    context "#stations" do
      it "returns an array of hashes with station data" do
        raw_stations = subject.fuel_stations
        raw_station  = raw_stations.first

        expect(raw_stations.count).to eq 10
        expect(raw_station).to have_key :station_name
        expect(raw_station).to have_key :fuel_type_code
        expect(raw_station).to have_key :distance
        expect(raw_station).to have_key :access_days_time
        expect(raw_station).to have_key :street_address
        expect(raw_station).to have_key :city
        expect(raw_station).to have_key :state
        expect(raw_station).to have_key :zip
      end
    end
  end
end
