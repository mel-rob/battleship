class Board

  attr_reader :cells

  def initialize
    @cells = { "A1" => Cell.new("A1"),
               "A2" => Cell.new("A2"),
               "A3" => Cell.new("A3"),
               "A4" => Cell.new("A4"),
               "B1" => Cell.new("B1"),
               "B2" => Cell.new("B2"),
               "B3" => Cell.new("B3"),
               "B4" => Cell.new("B4"),
               "C1" => Cell.new("C1"),
               "C2" => Cell.new("C2"),
               "C3" => Cell.new("C3"),
               "C4" => Cell.new("C4"),
               "D1" => Cell.new("D1"),
               "D2" => Cell.new("D2"),
               "D3" => Cell.new("D3"),
               "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    return false unless coordinates.all? { |coordinate| valid_coordinate?(coordinate) }

    return false unless ship.length == coordinates.length

    return false unless ships_dont_overlap(coordinates) == true

    return true if valid_placement_horizontal(ship, coordinates) == true

    return true if valid_placement_vertical(ship, coordinates) == true

    return false
  end


  def valid_placement_vertical(ship, coordinates)
    letters = coordinates.map { |coordinate| coordinate[0] }
    numbers = coordinates.map { |coordinate| coordinate[1] }
    yrange = Range.new(letters.sort.first, letters.sort.last).count
    yrange == ship.length && numbers.uniq.count == 1
  end


  def valid_placement_horizontal(ship, coordinates)
    letters = coordinates.map { |coordinate| coordinate[0] }
    numbers = coordinates.map { |coordinate| coordinate[1] }
    xrange = Range.new(numbers.sort.first, numbers.sort.last).count
    xrange == ship.length && letters.uniq.count == 1
  end

  def place(ship, coordinates)
    coordinates.each { |coordinate| @cells[coordinate].place_ship(ship) }
  end

  def ships_dont_overlap(coordinates)
    coordinates.all? { |coordinate| @cells[coordinate].ship == nil }
  end

  def render(show_ships = false)

    a = @cells.keys[0..3].map { |coordinate| @cells[coordinate].render(show_ships) }
    b = @cells.keys[4..7].map { |coordinate| @cells[coordinate].render(show_ships) }
    c = @cells.keys[8..11].map { |coordinate| @cells[coordinate].render(show_ships) }
    d = @cells.keys[12..15].map { |coordinate| @cells[coordinate].render(show_ships) }

    "  1 2 3 4 \n" + "A #{a.join(" ")} \n" + "B #{b.join(" ")} \n" + "C #{c.join(" ")} \n" + "D #{d.join(" ")} \n"
  end
end
