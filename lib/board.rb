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

  def valid_placement?(name, coordinates)
    if coordinates.all? { |coordinate| valid_coordinate?(coordinate) }

      ships_dont_overlap(coordinates) == true &&
      valid_placement_horizontal(name, coordinates) == true ||
      valid_placement_vertical(name, coordinates) == true
    else
      false
    end
  end

  def valid_placement_vertical(name, coordinates)
    letters = coordinates.map { |coordinate| coordinate[0] }
    numbers = coordinates.map { |coordinate| coordinate[1] }
    yrange = Range.new(letters.sort.first, letters.sort.last).count
    yrange == name.length && numbers.uniq.count == 1
  end


  def valid_placement_horizontal(name, coordinates)
    letters = coordinates.map { |coordinate| coordinate[0] }
    numbers = coordinates.map { |coordinate| coordinate[1] }
    xrange = Range.new(numbers.sort.first, numbers.sort.last).count
    xrange == name.length && letters.uniq.count == 1
  end

  def place(name, coordinates)
    coordinates.each { |coordinate| @cells[coordinate].place_ship(name) }
  end

  def ships_dont_overlap(coordinates)
    coordinates.all? { |coordinate| @cells[coordinate].ship == nil }
  end

  def render
    "  1 2 3 4 \n" +
    "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n" +
    "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n" +
    "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n" +
    "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"
  end
end
