require_relative 'carriage'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'station'
require_relative 'route'
require_relative 'interface'

interface = Interface.new
interface.run
