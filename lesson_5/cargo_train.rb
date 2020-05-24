class CargoTrain < Train
	def add_carrige
	if carriage.class == CargoCarriage
	 super(carriage)
	end
end
	 	 	
