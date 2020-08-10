class DockingStation
  attr_reader :bikes
  CAPACITY = 20

  def initialize(capacity: CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    return  "Sorry,full" if full?
    @bikes << bike
  end

  def release
    return "Sorry there are none" if empty?
    return "Sorry there are no working bikes available" if no_working_bikes?
    bikes.find { |bike| bike.working }
  end

  def broken_bikes
    bikes.select { |bike| !bike.working }
  end

  private
  def full?
    bikes.length >= @capacity
  end

  def empty?
    bikes.length == 0
  end

  def no_working_bikes?
    bikes.all? { |bike| !bike.working }
  end
end
