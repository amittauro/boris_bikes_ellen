class Van
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def collect(collected_bikes)
    collected_bikes.each { |bike| bikes << bike }
  end

  def deliver(garage)
    while bikes.size > 0 
      garage.bikes << bikes.pop
    end
  end
end