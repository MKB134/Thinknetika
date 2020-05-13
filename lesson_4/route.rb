class Route
  
  attr_accessor :stations, :from, :to,
  @name = name
  def initialize(from, to)
    @stations = [from, to]
    puts "Создан маршрут #{from} - #{to}"
  end

  def add_station
    station = gets.chomp
    self.stations.insert(-2, station) 
    puts "К маршруту #{stations.first.name} - #{stations.last.name} добавлена станция #{station.name}"
  end

  def remove_station(station)
    if [stations.first, stations.last].include?(station)
      puts "Первую и последнюю станции маршрута удалять нельзя!"
    else 
      self.stations.delete(station)
      puts "Из маршрута #{stations.first.name} - #{stations.last.name} удалена станция #{station.name}"
    end
  end

  def show_stations
    puts "В маршрут #{stations.first.name} - #{stations.last.name} входят станции: "
    stations.each {|station| puts " #{station.name}"}
  end  
end
