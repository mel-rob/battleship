class ComputerPlayer

  attr_reader :computer_cruiser, :computer_submarine
  attr_accessor :computer_board


  def initialize
    @computer_board = computer_board
    @computer_cruiser = computer_cruiser
    @computer_submarine = computer_submarine
  end

  def create_player
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
  end

  def generate_ship_placement(@ship)
    until @computer_board.valid_placement?(@ship, coordinates) == true
      coordinates = @computer_board.cells.keys.sample(@ship.length)
    end
    coordinates

    @computer_player = ComputerPlayer.new
    generate_ship_placement
  end

end


end
