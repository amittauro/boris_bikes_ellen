it "receives broken bikes" do
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
  result = garage.bikes.length
  expected = 2
  check_result(expected, result)
end