require 'rails_helper'

RSpec.describe "As a any type of user" do
  context "when I search for a zip code" do
    it "directs me to a page with with infor on nearest fuel stations" do
      #When I visit "/"
      visit root_path

      #And I fill in the search form with 80206
      fill_in :q, with: "80206"

      #And I click "Locate"
      click_on "Locate"
      
      #Then I should be on page "/search"
      expect(current_path).to eq(search_path)

      #Then I should see the total results of the stations that match my query, 90.
      expect(page).to have_content("93 Results Found")

      #Then I should see a list of the 15 closest stations within 5 miles sorted by distance
      expect(page.all('.location').count).to eq(15)

      #And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      within(page.all('.location').first) do
        expect(page).to have_content("Name: ")
        expect(page).to have_content("Address: ")
        expect(page).to have_content("Fuel Types: ")
        expect(page).to have_content("Distance From You: ")
        expect(page).to have_content("Open Hours: ")
      end
    end
  end
end
