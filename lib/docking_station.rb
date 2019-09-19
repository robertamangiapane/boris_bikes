require_relative 'bike'

class DockingStation

  def release_bike
    fail 'No bikes available' unless @bike
    @bike 
  end

  def dock_bike(bike)
   # We need to return the bike we dock
   # Use an instance variable to store the bike in the 'state' of this instance
    @bike = bike
  end

  # Use an attribute reader to read the @bike attribute we set
  attr_reader :bike

end
