require 'spec_helper'
require './app/models/station'

describe Station do
  let(:attrs) {
    {
      station_name: "UDR",
      fuel_type_code: "ELEC",
      distance: "0.31422",
      access_days_time: "24 hours daily",
      street_address: "800 Acoma St",
      city: "Denver",
      state: "CO",
      zip: "80204"
    }
  }

  subject { Station.new(attrs) }

  it "exists" do
    expect(subject).to be_a Station
  end

  context "instance methods" do
    context "#name" do
      it "returns a name" do
        expect(subject.name).to eq "UDR"
      end
    end

    context "#address" do
      it "returns a name" do
        expect(subject.address).to eq "800 Acoma St, Denver, CO 80204"
      end
    end

    context "#fuel_types" do
      it "returns a name" do
        expect(subject.fuel_types).to eq "ELEC"
      end
    end

    context "#distance" do
      it "returns a name" do
        expect(subject.distance).to eq "0.31422"
      end
    end

    context "#access_times" do
      it "returns a name" do
        expect(subject.access_times).to eq "24 hours daily"
      end
    end
  end
end
