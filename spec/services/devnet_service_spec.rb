require 'rails_helper'

RSpec.describe DevnetService do
  describe "instance methods" do
    it "gets locations" do
      zip = 80206
      service = DevnetService.new(zip)

      result = service.get_locations

      expect(result).to be_a(Hash)
      expect(result).to have_key(:total_results)
      expect(result[:fuel_stations]).to be_a(Array)
    end
  end
end
