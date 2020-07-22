class Carriage
  include Manufacturer
  attr_accessor  :capacity, :occupied_capacity
  attr_reader :number
  @@carriages_number = 0

  def initialize(capacity)
    @number = "WAG-#{@@carriages_number += 1}"
    @capacity = capacity
    @occupied_capacity = 0
  end
  def take_capacity(occupy)
   @occupied_capacity += occupy if @capacity >= (@occupied_capacity + occupy)
  end

  def free_capacity
    @capacity - @occupied_capacity
  end
end
