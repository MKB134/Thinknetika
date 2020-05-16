class Route
  
  attr_accessor :stations, :from, :to
  def initialize (from, to)

    @stations = [from,to]
    puts "Создан маршрут #{from.name} - #{to.name}"
  end

  def add_station(station)
    self.stations.insert(-2, station)
  end

  def remove_station(station)
    if [stations.first, stations.last].include?(station)
      puts "Первую и последнюю станции маршрута удалять нельзя!"
    else 
      self.stations.delete(station)
    end
  end

  def show_stations
    puts "В маршрут #{stations.first.name} - #{stations.last.name} входят станции: "
    stations.each {|station| puts " #{station.name}"}
  end
  def name
    "#{stations.first.name} - #{stations.last.name}" 
  end
end
