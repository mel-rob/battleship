require 'pry'
require './lib/game'

class Computer

  attr_reader :computer_board


  def initialize(board)
    @computer_board = board
  end


  def place_ship(ship)
    coordinates = []
    until @computer_board.valid_placement?(ship, coordinates) == true
      coordinates = @computer_board.cells.keys.sample(ship.length)
    end
    @computer_board.place(ship, coordinates)
  end

  def fire_upon_cell(board)
      coordinate = board.cells.keys.sample
    if board.cells[coordinate].fired_upon == false
      board.cells[coordinate].fire_upon
    end
    # @player_board.cells[coordinate].fire_upon
    coordinate
  end
end
