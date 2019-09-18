require_relative "bike"

class DockingStation
  @bikes = []

  def release_bike
    bike = Bike.new
  end

  def dock_bike(bike)
    @bikes << bike
  end
end
