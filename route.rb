# Train route class
class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
  end

  def include_station(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

  def exclude_station(station)
    unless [@stations[0], @stations[-1]].include?(station)
      @stations.delete(station)
    end
  end
end
