require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'

class Game

  def initialize
    # @board = Board.new
    # @cruiser = Ship.new("Cruiser", 3)
    # @submarine = Ship.new("Submarine", 2)
    # @computer_board = @board.render(false)
    @player = Player.new
  end


  def start
    @player.create_player
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
          puts @player.player_board.render(true)

            loop do
              puts "Enter the squares for the Cruiser (3 spaces):"
              puts "> "
                if @player.player_board.valid_placement?(@player.player_cruiser, coordinates = gets.chomp.upcase.split(" ")) == true
                    @player.player_board.place(@player.player_cruiser, coordinates)
                    puts "-" * 50
                    puts @player.player_board.render(true) + "\n"
                else
                  puts "-" * 50
                  puts "Those are invalid coordinates. Please try again:"
                  puts "-" * 50
                end
              

              puts "Enter the squares for the Submarine (2 spaces):"
              puts "> "
                if @player.player_board.valid_placement?(@player.player_submarine, coordinates = gets.chomp.upcase.split(" ")) == true
                  @player.player_board.place(@player.player_submarine, coordinates)
                  puts "-" * 50
                  puts @player.player_board.render(true) + "\n"
                else
                  puts "-" * 50
                  puts "Those are invalid coordinates. Please try again:"
                  puts "-" * 50
                end
              end
            end

    break if gets.chomp == "q"
      puts "You quit! Come back and play again later."
    end
    end
  end
end




game = Game.new
game.start
