class Interface
  attr_reader :current_station
  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def help
    puts("
      1.Cоздать станцию
      2.Cоздать поезд
      3.Прицепить вагон к поезду
      4.ОТцепить вагон от поезда
      5.Назначать маршрут поезду
      6.Создать маршрут управлять станциями в нем (добавлять, удалять)
      7.Посмотреть список поездов на станции
      8.Добавить станцию в маршрут
      9.Удаление станций с маршрута
      10.Назначить маршрут поезду
      11.Присвоить маршрут
      12.Следующая станция
      13.Предыдущая станция
      14.Забронировать место
    ")
  end

  def run
    help
    loop do
      print 'введите номер команды'
      choise = gets.chomp.to_i
      case choise

      when 1 #Создать станцию
        create_station
      when 2 #создать поезд
        create_train
      when 3 #прицепить вагон к поезду
        train = select_train
        if train.class == PassengerTrain
          train.add_carriage(PassengerCarriage.new)
        elsif train.class == CargoTrain
          train.add_carriage(CargoCarriage.new)
        end
      when 4 # ОТцепить вагон от поезда
        train = select_train
        train.remove_carriage(train.carriages.last)
      when 6 # создать маршрут
        print 'Выберите начальную станцию'
        station_1 = select_station
        print 'Выберите конечную станцию'
        station_2 = select_station
        @routes << Route.new(station_1, station_2)
        puts 'маршрут успешно создан'
      when 7
        show_routes
      when 8 #Добавление станции  в маршрут
        add_station
      when 9 # удаление станйии с маршрута
        remove_station
      when 10 # назначить маршрут поезду
        get_route
      when 11
        station_in_route
      when 12
        next_st
      when 13
        prev_st
      when 14
        take_capacity
      end
    end
  end

  def create_station
    puts 'Введите название'
    name = gets.chomp
    @stations << Station.new(name)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def create_train
    puts "Какой поезд вы хотите создать?\n1.Пассажирский\n2.Грузовой"
    choice = gets.chomp
    begin
      print 'Введите номер поезда '
      number = gets.chomp
      case choice
      when '1'
        @trains << PassengerTrain.new(number)
      when '2'
        @trains << CargoTrain.new(number)
      end
    rescue RuntimeError => e
      puts e.message
      retry
    end
    puts "Поезд #{number} успешно создан"
  end

  def show_trains
    @trains.each.with_index(1) do |train, index|
      puts "#{index}. Номер: #{train.number}. Тип: #{train.class}. Вагонов: #{train.carriages.size}."
    end
  end

  def select_train
    show_trains
    print 'Выберите поезд: '
    train_index = gets.chomp.to_i - 1
    @trains[train_index]
  end

  def show_stations
    @stations.each.with_index(1) do |station, index|
      puts "#{index}. #{station.name} "
    end
  end

  def select_station
    show_stations
    print 'Выберите станцию'
    route_station = gets.chomp.to_i - 1
    @stations[route_station]
  end

  def show_routes
    @routes.each.with_index(1) do |route, index|
      puts "#{index}. #{route.name}"
    end
  end

  def select_route
    show_routes
    print 'Выберите маршрут'
    route_index = gets.chomp.to_i - 1
    @routes[route_index]
  end

  def add_station
    route = select_route
    puts 'Добавление станции'
    station = select_station
    route.add_station(station)
    puts "Добавлена станция #{station.name} в маршрут #{route.name}"
  end

  def remove_station
    route = select_route
    puts 'удаление станции'
    station = select_station
    route.remove_station(station)
    puts "Из маршрута #{route.name} удалена станция #{station.name}"
  end

  def get_route
    train = select_train
    route = select_route
    train.take_route(route)
  end

  def next_st
    train = select_train
    train.forward
  end

  def prev_st
    train = select_train
    train.backward
  end

  def station_in_route
    select_route
    route = select_route
    route.show_stations
  end

  def take_capacity
    train = select_train
    train_carriages(train)
    print 'Выберите вагон: '
    carriage = train.carriages[gets.to_i - 1]
    if carriage.is_a? PassengerCarriage
      if carriage.free_capacity.zero?
        puts "Ошибка! в вагоне #{carriage.number} нет свободных мест."
      else
        carriage.take_capacity
        puts "Пассажир добавлен, вагон #{carriage.number} поезд #{train.number}"
      end
    else
      print 'Какой объем товара загрузить: '
      volume = gets.to_f
      if volume > carriage.free_capacity
        puts "Ошибка! Для загрузки доступно: #{carriage.free_capacity}"
      else
        carriage.take_capacity(volume)
        puts "На вагон #{carriage.number} загружено #{volume}"
      end
    end
  end
end
