require 'pry'

class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end

  def empty?
    @coordinate != @ship
  end

  # def place_ship(ship)
  #   @coordinate = @ship
  # end

end


# cell knows its coordinates
# cell knows if it is available for a ship to be placed on it
# cell knows if it is occupied by a ship
# cell knows if it has been hit
