class Interface
  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def help
    puts ("
      1.Cоздать станцию
      2.Cоздать поезд
      3.Прицепить вагон к поезду
      4.ОТцепить вагон от поезда
      5.Назначать маршрут поезду
      6.Посмотреть список станций
      7.Посмотреть список поездов на станции
      Создавать маршруты и управлять станциями в нем (добавлять, удалять)
      Перемещать поезд по маршруту вперед и назад
      8.выход
    ")
  end

  def run
    help
    loop do
      print "введите номер команды"
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
      when 6 #посмотреть список станций
      	select_route
      end
    end
  end

  def create_station
    puts "Введите название"
    name = gets.chomp
    @stations << Station.new(name)
  end

  def create_train
    puts "Ведите номер поезда"
    number = gets.chomp
    puts "1 - пассажирский, 2 - грузовой"
    choise = gets.chomp.to_i
    case choise
    when 1
      @trains << PassengerTrain.new(number)
    when 2
      @trains << CargoTrain.new(number)
    end
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
		@stations.each.with_index do |station, index|
		puts "Станция: #{index} #{station.name} "
	end
end

  def select_route
  	show_stations
  	puts "from"
    from = gets.chomp.to_i - 1
    puts "to"
    to = gets.chomp.to_i - 2 
    Route.new(from.name, to.name)
  end
end
 

