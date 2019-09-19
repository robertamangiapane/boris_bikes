require_relative 'bike'

class DockingStation

  attr_reader :docked_bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @docked_bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @docked_bikes.pop
  end

  def dock_bike(bike)
   fail 'Docking station full' if full?
   @docked_bikes << bike
  end

  private

  def full?
    return true if @docked_bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    return true if @docked_bikes.count == 0
  end
end
