# Station class
class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains << train unless @trains.include?(train)
  end

  def depart_train(train)
    @trains.delete(train)
  end

  def trains(type = nil)
    if type.nil?
      @trains
    else
      @trains.map { |e| e.type == type }
    end
  end
end
