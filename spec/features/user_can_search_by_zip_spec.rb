require "rails_helper"

feature "User searches by zip" do
  scenario "they see a list of station results" do
    visit "/"
    fill_in :q, with: "80203"
    click_on "Locate"
    expect(current_path).to eq("/search")
    expect(current_url).to include("q=80203")
    # within 6 miles sorted by distance
    expect(page).to have_css(".station", count: 10)
    # And the stations should be limited to Electric and Propane
    within(first(".station")) do
      expect(page).to have_css(".name")
      expect(page).to have_content("UDR")

      expect(page).to have_css(".address")
      expect(page).to have_content("800 Acoma St, Denver, CO 80204")

      expect(page).to have_css(".fuel_types")
      expect(page).to have_content("ELEC")

      expect(page).to have_css(".distance")
      expect(page).to have_content("0.31422")

      expect(page).to have_css(".access_times")
      expect(page).to have_content("24 hours daily")
    end
  end
end
