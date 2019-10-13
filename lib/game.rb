require './lib/board'
require './lib/cell'
require './lib/ship'

class Game

  def initialize
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
    @computer_board = @board.render(false)
    @player_board = @board.render(true)
  end


  def start
    loop do
      puts "-" * 50
      puts "Welcome to BATTLESHIP"
      puts "Enter p to play. Enter q to quit."
      puts "-" * 50
      if gets.chomp == "p"
        loop do
          puts "-" * 50
          puts "I have laid out my ships on the grid."
          puts "You now need to lay out your two ships."
          puts "The Cruiser is two units long and the Submarine is three units long."
          puts "-" * 50
          puts @player_board
          coordinates = []
          loop do until placement == @cruiser.length
            puts "Enter the squares for the Cruiser (3 spaces):"
            puts "> "
            coordinates << gets.chomp.downcase
          end
        end
            @board.place(@cruiser, coordinates)
          end
            puts @player_board
        end

        end
      # break if gets.chomp == "q"
      #   puts "You quit! Come back and play again later."
      # end
    end
  end




game = Game.new
game.start
