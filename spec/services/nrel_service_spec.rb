require 'rails_helper'

describe NrelService do
  context ".stations_by_zip(zip)" do
    it "returns an array of hashes with station data" do
      raw_stations = NrelService.stations_by_zip("80203")
      expect(raw_stations.count).to eq(10)
    end
  end
end
