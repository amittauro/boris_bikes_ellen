# As a member of the public
# So I can return bikes I’ve hired
# I want to dock my bike at the docking station

it "docking my bike" do
  # setup
  docking_station = DockingStation.new
  bike = Bike.new

  #execute
  result = docking_station.dock(bike) == [bike]

  expected = true
  #verify
  check_result(expected, result)

end
#
# As a member of the public,
# So that I can use a bike,
# I’d like a docking station to release a bike.

it "releases a bike " do

# setup
  docking_station = DockingStation.new
  bike = Bike.new
  docking_station.dock(bike)
  # execute
  result = docking_station.release
  expected = bike
# verify
  check_result(expected, result)
end

# # Part 2
# As a member of the public,
# So that I am not confused and charged unnecessarily,
# I’d like docking stations not to release bikes when there are none available.


it "Does not releases bikes if there are none  " do

# setup
  docking_station = DockingStation.new
  # execute
  result = docking_station.release
  expected =  "Sorry there are none"
# verify
  check_result(expected, result)
end



# As a system maintainer,
# So that I can control the distribution of bikes,
# I’d like docking stations not to accept more bikes than their capacity, which is by default 20.

it 'Has a capacity of 20' do
#setup and execute
docking_station = DockingStation.new
#verify
result = DockingStation::CAPACITY
expected = 20
# verify
check_result(expected, result)
end


it 'Will not dock a bike if there is no capacity' do
#setup and execute
docking_station = DockingStation.new
# bike = Bike.new
20.times do docking_station.dock(Bike.new)
end
#execute
result = docking_station.dock(Bike.new)
expected = "Sorry,full"
# verify
check_result(expected, result)
end

# As a system maintainer,
# So that I can manage broken bikes and not disappoint users,
# I’d like docking stations not to release broken bikes.
# it releases a working bike if there is one available
# it gives a helpful message if none is available

it 'releaes a working bike if there is one available' do
  #setup and execute
  docking_station = DockingStation.new
  working_bike = Bike.new
  broken_bike = Bike.new
  broken_bike.not_working
  docking_station.dock(working_bike)
  docking_station.dock(broken_bike)

  #execute
  result = docking_station.release
  expected = working_bike

  #verify
  check_result(expected, result)
end

it "gives a helpful message if none is available" do
  #setup and execute
  docking_station = DockingStation.new
  broken_bike = Bike.new
  very_broken_bike = Bike.new
  broken_bike.not_working
  very_broken_bike.not_working
  docking_station.dock(broken_bike)
  docking_station.dock(very_broken_bike)

  #execute
  result = docking_station.release
  expected = "Sorry there are no working bikes available"

  #verify
  check_result(expected, result)
end

