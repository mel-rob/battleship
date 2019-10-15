require 'pry'

class Cell
  attr_reader :coordinate, :ship, : status, :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    @status = "."
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
    @fired_upon = true
    if @ship != nil
      @ship.health -= 1
    end
  end

  def render(player = false)
    if player == true && @ship != nil && @fired_upon == false
      "S"
    elsif @ship == nil && @fired_upon == true
      @status = "miss"
      "M"
    elsif @ship != nil && @fired_upon == true && @ship.health > 0
      @status = "hit"
      "H"
    elsif @ship != nil && @fired_upon == true && @ship.health == 0
      "X"
    else
      "."
    end
  end
end
