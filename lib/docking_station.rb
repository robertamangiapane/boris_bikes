require_relative "bike"

class DockingStation

  def release_bike
    Bike.new
  end

  def dock_bike(bike)
   # We need to return the bike we dock
    @bike = bike
  end

  def bike
    @bike
  end

end
