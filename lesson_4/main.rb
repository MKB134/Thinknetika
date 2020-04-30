require_relative 'Carriage'
require_relative 'Cargo_train'
require_relative 'Passenger_train'
require_relative 'Passeger_Car'
require_relative 'Cargo_car'
require_relative 'Station'
require_relative 'Train'
require_relative 'Route'

stations = []
trains = []

puts (
	1.Поздать станцию
	2.Поздать поезд
	3.Прицепить вагон к поезду
	4.ОТцепить вагон от поезда
	5.поместить поезд на станцию
	6.Посмотреть список станций
	7.Посмотреть список поездов на станции
	8.выход
	)
loop do 
	print "введите номер команды"
	choise = gets.chomp.to_i
	case choise
	
	when 1 #Создать станцию
		puts "Введите название"
		name = gets.chomp
		stations << Station.new(name)


	when 2 #создать поезд
		puts "Ведите номер поезда"
		number = gets.chomp
		puts "1 - пассажирский, 2 - грузовой"
		choise = gets.chomp.to_i
	when 1 
		trains << PassengerTrain.new(number)
	when 2
		trains << CargoTrain.new(number)
	end

when 3 #прицепить вагон к поезду
	if
		train.add.
	end

when 6 #посмотреть список станций
	puts "список станций:"
	stations.each{|station| puts station.name}
	

