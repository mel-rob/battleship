class Ship

  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

# Should this be returning a value?
  def hit
    @health -= 1
  end

  # def hit?
  #   if @health < ship.length
  # end

  def sunk?
    @health == 0
  end


end
