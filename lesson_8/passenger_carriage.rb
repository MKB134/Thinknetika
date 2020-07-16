class PassengerCarriage < Carriage
  def take_capacity
    @occupied_capacity += 1 if @capacity > @occupied_capacity
  end
end
