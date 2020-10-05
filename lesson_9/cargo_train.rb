class CargoTrain < Train
  def add_carriage(carriage)
    super(carriage) if carriage.class == CargoCarriage
  end
end
