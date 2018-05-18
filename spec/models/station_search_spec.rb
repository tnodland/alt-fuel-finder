require 'rails_helper'

describe StationSearch do
  subject { StationSearch.new("80203") }

  it "exists" do
    expect(subject).to be_a StationSearch
  end

  context "instance methods" do
    context "#stations" do
      it "returns a collection of stations" do
        stub_request(:get, "http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['NREL_API_KEY']}&location=80203&radius=6.0&limit=10&fuel_type=ELEC,LPG").
          to_return(status: 200, body: File.read("./spec/fixtures/nrel_nearest_stations.json"))
          expect(subject.stations.count).to eq 10
          station = subject.stations.first

          expect(station).to be_a Station
      end
    end
  end
end
