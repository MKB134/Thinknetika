class CargoTrian < train
  def initialaize (number, type = "Cargo")
    super
  end

  def add_CargoCarriage
    carriage = CargoCarriage.new
    train.add_carriage(carriage) 
  end