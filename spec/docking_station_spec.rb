require 'docking_station'

describe DockingStation do

  let(:bike) { Bike.new }

=begin
  it 'station has a default capacity' do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end
=end
  describe 'initialization' do
    it "defaults capacity" do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock_bike(bike)
      end
    end
  end

  it 'station has a custom capacity' do
    docking_station = DockingStation.new(30)
    30.times{docking_station.dock_bike(bike)}
    expect { docking_station.dock_bike(bike) }.to raise_error 'Docking station full'
  end

  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike' do
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock_bike' do
    it { is_expected.to respond_to(:dock_bike).with(1).argument }

    it "docks a bike" do
      expect(subject.dock_bike(bike)).to eq subject.bikes
    end

    it "returns docked bike" do
      expect(subject.dock_bike(bike)).to eq subject.bikes
    end
=begin
    it 'raises an error when station is full' do
      subject.capacity.times{subject.dock_bike(bike)}
      expect { subject.dock_bike(bike) }.to raise_error 'Docking station full'
    end
=end
  end
end
