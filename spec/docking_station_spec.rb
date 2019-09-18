require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    it "gives a bike" do
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it { is_expected.to respond_to(:dock_bike).with(1).argument }

    it { is_expected.to respond_to :bike }

    it "docks a bike" do
      bike = Bike.new
      expect(subject.dock_bike(bike)).to eq bike
    end

    it "returns docked bike" do
      bike = Bike.new
      subject.dock_bike(bike)
      # Again, we need to return the bike we just docked
      expect(subject.bike).to eq bike
    end

    it "throws error if no bikes in station" do
      expect{ subject.release_bike }.to raise_error("no bikes")
    end

end
