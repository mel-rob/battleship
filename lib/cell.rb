require 'pry'

class Cell
  attr_reader :coordinate, :ship, :status

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

end
