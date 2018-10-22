require 'spec_helper'
require 'faraday'
require 'json'
require 'byebug'
require './app/facades/station_facade'

describe StationFacade do
  let(:station) { double(id: 1, convenience_store?: true, nrel_id: "66897") }

  subject { StationFacade.new(station.id) }

  it "exists with standard attributes" do
    allow_any_instance_of(StationFacade).to receive(:station).and_return(station)

    expect(subject).to be_a StationFacade
    expect(subject.name).to eq("UDR")
    expect(subject.status).to eq("This station is currently open.")
    expect(subject.convenience_store?).to eq(true)
  end
end
