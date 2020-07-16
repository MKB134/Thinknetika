class Carriage
  include Manufacturer
  attr_reader :number, :capacity, :occupied_capacity
  @@carriages_number = 0

  def initialize(capacity)
    @number = "WAG-#{@@carriages_number += 1}"
    @capacity = capacity
    @occupied_capacity = 0
  end

  def free_capacity
    @capacity - @occupied_capacity
  end
end
