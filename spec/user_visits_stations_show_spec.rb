require "rails_helper"

feature "User visits Station show" do
  scenario "with a valid id" do
    station = Station.create(nrel_id: "66897", convenience_store: true)
    visit "/stations/#{station.id}"
    within(".station") do
      expect(page).to have_content("UDR")
      expect(page).to have_content("Convenience Store: true")
      expect(page).to have_content("This station is currently open.")
    end
    #   And I should see a list of nearby stations
    #   And each station should have a link to the station show
  end
end
