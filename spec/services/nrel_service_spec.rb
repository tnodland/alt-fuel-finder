require 'rails_helper'

describe NrelService do
  context "#find_by_zip(zip)" do
    it "returns parsed data by zip" do
      service = NrelService.new
      raw_stations = service.find_by_zip("80203")
      first_station = raw_stations.first

      expect(raw_stations.count).to eq(10)
      expect(raw_stations).to be_an(Array)
      expect(first_station).to be_an(Hash)
      expect(first_station).to have_key :station_name
      expect(first_station).to have_key :access_days_time
      expect(first_station).to have_key :fuel_type_code
      expect(first_station).to have_key :street_address
      expect(first_station).to have_key :city
      expect(first_station).to have_key :state
      expect(first_station).to have_key :zip
      expect(first_station).to have_key :distance
    end    
  end
end
