class CargoTrian < train
  def initialaize (number, type = "Cargo")
  end

  def add_CargoCarriage
    carriage = CargoCarriage.new
    train.add_carriage(carriage) 
  end
end
