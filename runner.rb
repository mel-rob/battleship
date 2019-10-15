require './lib/game'

def start
  loop do
    game = Game.new
    game.main_menu
    game.board_setup
      until @player_cruiser.sunk? && @player_submarine.sunk? || @computer_cruiser.sunk? && @computer_submarine.sunk?
        game.turn
      end
    game.end
  end
end

start
