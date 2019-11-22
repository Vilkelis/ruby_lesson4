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
    raise 'You must stop the train before include a railcar' if speed.zero?

    @railcar_count += 1
  end

  def exclude_railcar
    raise 'You must stop the train before exclude a railcar' if speed.zero?

    @railcar_count -= 1 if @railcar_count > 0
  end

  def route=(route)
    @route = route
    @current_station_index = 0
  end

  def go(direction = :forward)
    if direction == :forward
      @current_station_index += 1 if @current_station_index <
                                     route.stations.count - 1
    elsif @current_station_index > 0
      @current_station_index -= 1
    end
  end

  def current_station
    route.stations[@current_station_index]
  end

  def next_station
    route.stations[@current_station_index + 1] if @current_station_index <
                                                  route.stations.count - 1
  end

  def prev_station
    route.stations[@current_station_index - 1] if @current_station_index > 0
  end
end
