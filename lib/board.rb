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
    @cells.key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    return false unless coordinates.all? { |coordinate| valid_coordinate?(coordinate) }

    return false unless ships_dont_overlap(coordinates)

    return true if split_array_letters(coordinates) == ship.length && split_array_numbers(coordinates) == 1

    return true if split_array_numbers(coordinates) == ship.length && split_array_letters(coordinates) == 1

    return false
  end

  def split_array_letters(coordinates)
    letters = coordinates.map { |coordinate| coordinate[0] }
    letter_range = Range.new(letters.sort.first, letters.sort.last).count
    letter_range
  end


  def split_array_numbers(coordinates)
    numbers = coordinates.map { |coordinate| coordinate[1] }
    number_range = Range.new(numbers.sort.first, numbers.sort.last).count
    number_range
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
