class CargoCarriage < Carriage
	def take_capacity
		super(occupy)
	end
end

