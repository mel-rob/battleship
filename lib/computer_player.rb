require 'pry'


class ComputerPlayer

  attr_reader :computer_cruiser, :computer_submarine
  attr_accessor :computer_board


  def initialize
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
  end


  def generate_ship_placement
    coordinates = []
    until @computer_board.valid_placement?(@computer_cruiser, coordinates) == true
      coordinates = @computer_board.cells.keys.sample(@computer_cruiser.length)
    end
    coordinates
  end

  def computer_fire_upon
    #generate a coordinate and fire upon that coordinate.
    #Needs to look at the player board and make sure it has not taken a shot
    until @computer_board.valid_placement?(@computer_cruiser, coordinates) == false
      coordinates = @computer_board.cells.keys.sample(@computer_cruiser.length)
  end
end
