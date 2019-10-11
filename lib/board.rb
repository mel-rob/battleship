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
    ships_dont_overlap(coordinates) == true &&
    valid_placement_horizontal(name, coordinates) == true ||
    valid_placement_vertical(name, coordinates) == true
  end


  # def valid_placement?(name, coordinates)
  #
  #   letters = coordinates.map { |coordinate| coordinate[0] }
  #   numbers = coordinates.map { |coordinate| coordinate[1] }
  #
  #   yrange = Range.new(letters.sort.first, letters.sort.last).count
  #   xrange = Range.new(numbers.sort.first, numbers.sort.last).count
  #
  #     if xrange == name.length && letters.uniq.count == 1
  #       true
  #     elsif yrange == name.length && numbers.uniq.count == 1
  #       true
  #     else
  #       false
  #     end
  # end

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
end
