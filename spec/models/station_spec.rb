require 'rails_helper'

describe Station do
  it "is a legit station" do
    raw_station = {
      :station_name=>"Shell",
      :access_days_time=>"24 hours daily",
      :fuel_type_code=>"ELEC",
      :street_address=>"1510 Blake St",
      :city=>"Denver",
      :state=>"CO",
      :zip=>"80203",
      :distance=>0.31422
    }

    # { :intersection_directions=>"816 ACOMA 1; For residents only - 5th Floor", :plus4=>nil, , :bd_blends=>nil, :e85_blender_pump=>nil, :ev_connector_types=>["J1772"], :ev_dc_fast_num=>nil, :ev_level1_evse_num=>nil, :ev_level2_evse_num=>2, :ev_network=>"ChargePoint Network", :ev_network_web=>"http://www.chargepoint.com/", :ev_other_evse=>nil, :hy_status_link=>nil, :lpg_primary=>nil, :ng_fill_type_code=>nil, :ng_psi=>nil, :ng_vehicle_class=>nil, :ev_network_ids=>{:posts=>["1:118249"]}, :distance=>0.31422}

    station = Station.new(raw_station)

    expect(station.name).to eq("Shell")
    expect(station.address).to eq("1510 Blake St Denver, CO 80203")
    expect(station.fuel_types).to eq("ELEC")
    expect(station.access_times).to eq("24 hours daily")
    expect(station.distance).to eq(0.31422)
  end
end
