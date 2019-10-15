class Player

  attr_reader :player_cruiser, :player_submarine
  attr_accessor :player_board


  def initialize
    @player_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
  end

end
