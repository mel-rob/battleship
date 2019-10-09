require 'pry'

class Cell
  attr_reader :coordinate, :ship, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    # @status = "."
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

  def fire_upon
    # Do we need health to subtract here?
    # @health -= 1
    @fired_upon = true
  end

  def render(player = true)
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
