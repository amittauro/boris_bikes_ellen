it "collects a broken bike" do
  #setup
  van = Van.new
  docking_station = DockingStation.new
  broken_bike = Bike.new
  broken_bike.not_working
  docking_station.dock(broken_bike)
  bikes = docking_station.broken_bikes
  
  #execute
  van.collect(bikes)

  #verify
  result = van.bikes
  expected = [broken_bike]
  check_result(expected, result)
end

it "collects multiple broken bikes" do
  #setup
  van = Van.new
  docking_station = DockingStation.new
  broken_bike = Bike.new
  broken_bike.not_working
  very_broken_bike = Bike.new
  very_broken_bike.not_working
  docking_station.dock(broken_bike)
  docking_station.dock(very_broken_bike)
  bikes = docking_station.broken_bikes
  
  #execute
  van.collect(bikes)

  #verify
  result = van.bikes.length
  expected = 2
  check_result(expected, result)
end


it "collects only broken bikes" do
  #setup
  van = Van.new
  docking_station = DockingStation.new
  working_bike = Bike.new
  broken_bike = Bike.new
  broken_bike.not_working
  very_broken_bike = Bike.new
  very_broken_bike.not_working
  docking_station.dock(working_bike)
  docking_station.dock(broken_bike)
  docking_station.dock(very_broken_bike)
  bikes = docking_station.broken_bikes
  
  #execute
  van.collect(bikes)

  #verify
  result = van.bikes.length
  expected = 2
  check_result(expected, result)
end

it "delivers broken bikes" do
  #setup
  van = Van.new
  garage = Garage.new
  broken_bike = Bike.new
  broken_bike.not_working
  very_broken_bike = Bike.new
  very_broken_bike.not_working
  van.collect([broken_bike,very_broken_bike])

  #execute
  van.deliver(garage)
  
  #verify 
  result = van.bikes
  expected = []
  check_result(expected, result)
end