require 'rails_helper'

describe "User can search by zipcode" do
  it "by valid zip" do
    visit '/'
    fill_in :q, with: '80203'
    click_on 'Locate'
    expect(current_path).to eq('/search')
    expect(page).to have_selector('.station', count: 10)
    within('.station:first') do
      expect(page).to have_content('ELEC')
      expect(page).to have_content('UDR')
      expect(page).to have_content('800 Acoma St, Denver, CO')
      expect(page).to have_content('0.3117')
      expect(page).to have_content('24 hours daily')
    end
  end
end
