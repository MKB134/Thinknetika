class Train

  attr_accessor :speed, :number, :car_count, :route, :station
  attr_reader :type

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
    self.route = route
    puts "Поезду №#{number} задан маршрут #{route.stations.first.name} - #{route.stations.last.name}" 
  end

  def go_to(station)
    if route.nil?
      puts "Без маршрута поезд заблудится."
    elsif @station == station
      puts "Поезд №#{@number} и так на станции #{@station.name}"
    elsif route.stations.include?(station)
      @station.send_train(self) if @station
      @station = station
      station.get_train(self)
    else
      puts "Станция #{station.name} не входит в маршрут поезда №#{number}"
    end
  end

  def stations_around
    if route.nil?
      puts "Маршрут не задан"
    else
      station_index = route.stations.index(station)
      puts "Сейчас поезд на станции #{station.name}."
      puts "Предыдущая станция - #{route.stations[station_index - 1].name}." if station_index != 0
      puts "Следующая - #{route.stations[station_index + 1].name}." if station_index != route.stations.size - 1
    end
  end