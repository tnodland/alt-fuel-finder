require 'rails_helper'

feature "user searches for stations by zip" do
  it "with a valid" do
    visit "/"
    fill_in "q", with: 80203
    click_on "Locate"
    expect(current_path).to eq("/search")



    expect(page).to have_css(".station", count: 10)
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    # And the stations should be limited to Electric and Propane => handle in unit test
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    within first(".station") do
      expect(page).to have_css(".name")
      expect(page).to have_css(".fuel_type")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".access_times")
    end
  end
end
