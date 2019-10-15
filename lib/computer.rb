require 'pry'


class Computer

  attr_reader :computer_board


  def initialize(board)
    @computer_board = board
  end


  def generate_ship_placement(ship)
    coordinates = []
    until @computer_board.valid_placement?(ship, coordinates) == true
      coordinates = @computer_board.cells.keys.sample(ship.length)
    end
    @computer_board.place(ship, coordinates)
  end

  def fire_upon_cell
    coordinate = []
    until @player_board.cells[coordinate].fired_upon == false
      coordinate = @player_board.cells.keys.sample
      @player_board.cells[coordinate].fire_upon
    end
    coordinate
  end
end
