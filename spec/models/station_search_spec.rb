require 'rails_helper'

describe StationSearch do
  subject { StationSearch.new("80203") }

  it "exists" do
    expect(subject).to be_a StationSearch
  end

  context "instance methods" do
    context "#stations" do
      it "returns a collection of stations" do
        expect(subject.stations.count).to eq 10
        station = subject.stations.first

        expect(station).to be_a Station
      end
    end
  end
end
