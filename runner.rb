require './lib/ship'
require './lib/cell'


cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)
cell_1 = Cell.new("B4")
cell_2 = Cell.new("C4")
cell_3 = Cell.new("D4")
cells = [cell_1, cell_2, cell_3]


p cell_1.ship
p cell_1.empty?
cell_1.place_ship(cruiser)
p cell_1.empty?
p cell_1.ship








# Testing Ship
# p cruiser.name
# p cruiser.length
# p cruiser.health
#
#
# cruiser.hit
# p cruiser.health
# p cruiser.length
# p cruiser.sunk?
# cruiser.hit
# p cruiser.health
# p cruiser.length
# cruiser.hit
# p cruiser.health
# p cruiser.sunk?
