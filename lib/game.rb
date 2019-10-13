require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/player'

class Game

  def initialize
    @board = Board.new
    # @cruiser = Ship.new("Cruiser", 3)
    # @submarine = Ship.new("Submarine", 2)
    # @computer_board = @board.render(false)
    # @player_board = @board.render(true)
    @player = Player.new
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

            loop do
              puts "Enter the squares for the Cruiser (3 spaces):"
              puts "> "
                if @board.valid_placement?(@cruiser, coordinates = gets.chomp.upcase.split(" ")) == true
                  @player.board.place(@cruiser, coordinates)
                end

                loop do
                  puts "-" * 50
                  puts "Yay! Valid coordinates."
                  puts "Enter the squares for the Submarine (2 spaces):"
                  puts "> "
                  puts @player_board
                  break
                end
              else
                puts "Those are invalid coordinates. Please try again:"
                break
              end
            end
          end



          end

      end
          #     @board.place(@cruiser, coordinates)
          #   end
          #     puts @player_board
          # end
        end

      # break if gets.chomp == "q"
      #   puts "You quit! Come back and play again later."
      # end





game = Game.new
game.start
