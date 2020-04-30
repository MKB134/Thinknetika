class PassengerTrain < train 
  
  def initialaze (number, type = "passenger")
  
  end

  def add_Passenger_carriage (carriage)
    carriage = PassengerCarriage.new
    train.add_carriage(carriage)
  end
end
