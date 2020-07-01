class CargoTrain < Train
  def add_carriage(carriage)
    if carriage.class == CargoCarriage
      super(carriage)
    end
  end
end
