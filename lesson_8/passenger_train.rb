class PassengerTrain < Train
  def add_carriage(carriage)
    if carriage.class == PassengerCarriage
      super(carriage)
    end
  end
end
