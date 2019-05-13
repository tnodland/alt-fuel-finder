require 'rails_helper'

RSpec.describe "As a any type of user" do
  context "when I search for a zip code" do
    it "directs me to a page with with infor on nearest fuel stations" do
      #When I visit "/"
      visit root_path
      # save_and_open_page
      #And I fill in the search form with 80206
      fill_in :q, with: "80206"

      #And I click "Locate"
      click_on "Locate"

      #Then I should be on page "/search"
      expect(current_path).to eq(search_path)

      #Then I should see the total results of the stations that match my query, 90.
      expect(page).to have_content("90 Results Found")
    end
  end
end
