require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    # Use a '#' before a method name to imply that it is an instance method.
     # Until now, we have been describing behaviour in a general sense. However,
     # We are now describing behaviour specific to a particular method.
     # By nesting this in another describe block, we are able to DRY out our
     # descriptions.
    describe '#release_bike' do
      it 'releases a bike' do
        bike = Bike.new
        subject.dock_bike(bike)
        #release the bike we docked
        expect(subject.release_bike).to eq bike
      end

      it 'raises an error when no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end
    end

    describe '#dock_bike' do
      it { is_expected.to respond_to(:dock_bike).with(1).argument }

      it "docks a bike" do
        bike = Bike.new
        expect(subject.dock_bike(bike)).to eq subject.docked_bikes
      end

      it "returns docked bike" do
        bike = Bike.new
        # Again, we need to return the bike we just docked
        expect(subject.dock_bike(bike)).to eq subject.docked_bikes
      end

      it 'raises an error when bike capacity hits 20' do
        DockingStation::DEFAULT_CAPACITY.times{subject.dock_bike(Bike.new)}
        expect { subject.dock_bike(Bike.new) }.to raise_error 'Docking station full'
      end
    end
end
