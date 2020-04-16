class Train

  attr_accessor :speed, :number, :car_count
  attr_reader :type, :route, :current_station

  def initialize(number, type, car_count)
    @number = number
    @type = type
    @car_count = car_count
    @speed = 0
    puts "Создан поезд № #{number}. Тип: #{type}. Количество вагонов: #{car_count}."
  end

  def stop
    @speed = 0
  end

  def add_car
    if speed.zero?
      self.car_count += 1
      puts "К поезду №#{number} прицепили вагон. Теперь их #{car_count}."
    else
      puts "На ходу нельзя прицеплять вагоны!"
    end
  end

  def remove_car
    if car_count.zero?
      puts "Вагонов уже не осталось."
    elsif speed.zero?
      self.car_count -= 1
      puts "От поезда №#{number} отцепили вагон. Теперь их #{car_count}."
    else
      puts "На ходу нельзя отцеплять вагоны!"
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
