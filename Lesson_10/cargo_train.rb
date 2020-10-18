class CargoTrain < Train
	validate :number, :type, String
  validate :number, :presence
  validate :number, :format, NUMBER_TYPE

  def type
    'грузовой'
  end
  def add_carriage(carriage)
    super(carriage) if carriage.class == CargoCarriage
  end
end
