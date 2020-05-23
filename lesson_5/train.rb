class Train

  attr_accessor :speed, :number, :carriages 
  attr_reader  :current_station, :route
  @@trains = {}

  def initialize(number)
    @number = number
    @speed = 0
    @carriages = []
    puts "Создан поезд № #{number}. Тип: #{self.class}. Количество вагонов: #{@carriages.size}."
    @@trains = [self.number] = self
  end

  def stop
    @speed = 0
  end

  def increase_speed
    self.speed += 20
  end

  def add_carriage(carriage)
    if speed.zero?
      self.carriages << carriage
      puts "к поезду №#{number} прицепили вагон."
    end
  end

  def remove_carriage(carriage)
    if speed.zero?
      self.carriages.delete(carriage)
      puts "от поезда №#{number} отцепили вагон"
    end
  end
  
    def take_route(route)
    @route = route
    @current_station = route.stations.first
    @current_station.get_train(self)
  end

  def current_station_index
    @route.stations.index(@current_station)
  end

  def next_station
    @route.stations[current_station_index + 1]
  end

  def prev_station
    @route.stations[current_station_index - 1] if current_station_index != 0
  end

  # Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад

  def forward
    if next_station
      @current_station.send_train(self)
      @current_station = next_station
      @current_station.get_train(self)
    else
      puts "Послед. станция"
    end
  end

  def backward
    if prev_station
      @current_station.send_train(self)
      @current_station = prev_station
      @current_station.get_train(self)
    else
      puts "Первая станция"
    end
  end
end
