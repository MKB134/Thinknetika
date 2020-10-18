require_relative './instance_counter'
require_relative './validate'
require_relative './accessors'
require_relative './manufacturer'
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
