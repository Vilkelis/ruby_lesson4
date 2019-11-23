# Train class
class Train
  POWER = 1

  attr_reader :number, :type, :railcar_count, :route, :speed

  def initialize(number, type, railcar_count)
    @number = number
    @type = type
    @railcar_count = railcar_count
    @speed = 0
  end

  def increase_speed
    @speed += POWER
  end

  def decrease_speed
    @speed -= POWER
    @speed = 0 if @speed < 0
  end

  def include_railcar
    raise 'You must stop the train before include a railcar' unless speed.zero?

    @railcar_count += 1
  end

  def exclude_railcar
    raise 'You must stop the train before exclude a railcar' unless speed.zero?

    @railcar_count -= 1 if @railcar_count > 0
  end

  def route=(route)
    @route = route
    self.current_station_index = 0
  end

  def go_forward
    self.current_station_index += 1
  end

  def go_backward
    self.current_station_index -= 1
  end

  def current_station
    route.stations[current_station_index] unless current_station_index.nil?
  end

  def next_station
    route.stations[current_station_index + 1] unless current_station_index.nil?
  end

  def prev_station
    route.stations[current_station_index - 1] if current_station_index > 0
  end

  protected

  attr_reader :current_station_index

  def current_station_index=(index)
    if index != @current_station_index &&
       index >= 0 && index < route.stations.count
      current_station.depart_train(self) unless current_station.nil?

      @current_station_index = index

      current_station.take_train(self)
    end
  end
end
