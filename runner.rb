require './lib/ship'


cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)

p cruiser.name
p cruiser.length
p cruiser.health


cruiser.hit
p cruiser.health
p cruiser.length
p cruiser.sunk?
cruiser.hit
p cruiser.health
p cruiser.length
cruiser.hit
p cruiser.health
p cruiser.sunk?
