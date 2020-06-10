class Room
  attr_reader :capacity, :occupants
  def initialize(max_cap)
    @capacity = max_cap
    @occupants = []
  end

  def full?
    @occupants.length >= @capacity
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(name)
    return false if full?

    occupants << name
    return true
  end

end
