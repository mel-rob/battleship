class Cell
  
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship == nil
  end

  def ship
    @ship
  end

  def place_ship(name)
    @ship = name
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    if @ship != nil
      @ship.health -= 1
    end
  end

  def render(player = false)
    if player == true && @ship != nil && @fired_upon == false
      "S"
    elsif @ship == nil && @fired_upon == true
      "M"
    elsif @ship != nil && @fired_upon == true && @ship.health > 0
      "H"
    elsif @ship != nil && @fired_upon == true && @ship.health == 0
      "X"
    else
      "."
    end
  end
end
