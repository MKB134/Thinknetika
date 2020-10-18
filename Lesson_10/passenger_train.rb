class PassengerTrain < Train
  validate :number, :type, String
  validate :number, :presence
  validate :number, :format, NUMBER_TYPE

  def type
    'пассажирский'
  end
  
  def add_carriage(carriage)
    super(carriage) if carriage.class == PassengerCarriage
  end
end
