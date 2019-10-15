require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/computer'
require 'pry'

class Game

  def initialize
    @player_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    # @player = Player.new(@player_board)
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @computer = Computer.new(@computer_board)
  end

  def start
    puts "-" * 50
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    puts "-" * 50
    response = gets.chomp[0].upcase
    if response == "P"
      @computer.place_ship(@computer_cruiser)
      @computer.place_ship(@computer_submarine)
      puts "-" * 50
      puts "I have laid out my ships on the grid."
      puts "You now need to lay out your two ships."
      puts "The Cruiser is three units long and the Submarine is two units long."
      puts "-" * 50
      puts @player_board.render(true)
      puts "Enter the squares for the Cruiser (3 spaces):"
      #have issue with commas between coordinates
      loop do
        print "> "
        #Remove commas?
        coordinates = gets.chomp.upcase.split(" ")
        if @player_board.valid_placement?(@player_cruiser, coordinates)
          @player_board.place(@player_cruiser, coordinates)
          puts "-" * 50
          puts @player_board.render(true) + "\n"
          break
        else
          puts "-" * 50
          puts "Those are invalid coordinates. Please try again:"
          puts "-" * 50
        end
      end
# Start of Submarine Placment
      puts "Enter the squares for the Submarine (2 spaces):"
      loop do
        print "> "
        coordinates = gets.chomp.upcase.split(" ")
        if @player_board.valid_placement?(@player_submarine, coordinates)
          @player_board.place(@player_submarine, coordinates)
          puts "-" * 50
          puts @player_board.render(true) + "\n"
          puts "************* Ready to play! *************" + "\n"
          break
        else
          puts "-" * 50
          puts "Those are invalid coordinates. Please try again:"
          puts "-" * 50
        end
      end

        until @player_cruiser.sunk? && @player_submarine.sunk? || @computer_cruiser.sunk? && @computer_submarine.sunk? do

          puts "=============COMPUTER BOARD============="
          puts @computer_board.render(false)
          puts "==============PLAYER BOARD=============="
          puts @player_board.render(true)
          puts "Enter the coordinate for your shot:"
          loop do
            coordinate = gets.chomp.upcase
            print "> "
            # binding.pry
            if @computer_board.valid_coordinate?(coordinate) && @computer_board.cells[coordinate].fired_upon == false
              @computer_board.cells[coordinate].fire_upon
              player_shot = coordinate
              @computer.fire_upon_cell(@player_board)
              break
            elsif !@computer_board.valid_coordinate?(coordinate)
              puts "Please enter a valid coordinate:"
            else
              puts "You have already fired on this coordinate. Please choose again:"
            end
          end
        end
       if @player_cruiser.sunk? && @player_submarine.sunk?
         puts "I won!"
         # break
       elsif @computer_cruiser.sunk? && @computer_submarine.sunk?
         puts "You won!"
         # break
       end
    elsif response == "Q"
      puts "You quit! Come back and play later!"
    end
  end
end
