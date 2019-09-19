require 'docking_station'

describe DockingStation do
    it { is_expected.to respond_to :release_bike }

    # use a '#' before a method name
     # to imply that it is an instance method.
     # Until now, we have been describing behaviour in a general sense. However,
     # we are now describing behaviour specific to a particular method.
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

    it { is_expected.to respond_to(:dock_bike).with(1).argument }

    it { is_expected.to respond_to(:bike) }

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
end
