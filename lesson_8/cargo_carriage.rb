class CargoCarriage < Carriage
def take_capacity(occupy)
   @occupied_capacity += occupy if @capacity >= (@occupied_capacity + occupy)
  end
end
