require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    it "gives a bike" do
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it { is_expected.to respond_to :dock_bike }

    it "add bikes to dock list" do
      # bike = subject.release_bike
      # bike.dock_bike
      expect(@bikes.count).to eq 1
    end

end
