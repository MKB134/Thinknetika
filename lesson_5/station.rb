class Station
  
  attr_reader :name, :trains
  @@all_stations = []

  def initialize(name)  
    @name = name
    @trains = []
    @all_stations << self
    puts "Построена станция #{name}"
  end

  def get_train(train)
   trains << train
   puts "На станцию #{name} прибыл поезд №#{train.number}"
 end

  def send_train(train)
    trains.delete(train)
    puts "Со станции #{name} отправился поезд №#{train.number}"     
  end

  def show_trains(type = nil)
    if type
      puts "Поезда на станции #{name} типа #{type}: "  
      trains.each {|train| puts train.number if train.type == type}
    else
      puts "Поезда на станции #{name}: "
      trains.each {|train| puts train.number}
    end
  
  def self.all
    @@all_stations
  end
end

