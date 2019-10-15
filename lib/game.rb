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
    response = gets.chomp.upcase[0]
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
      loop do
        print "> "
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
# Start of SUbmarine Placment
      puts "Enter the squares for the Submarine (2 spaces):"
      loop do
        print "> "
        coordinates = gets.chomp.upcase.split(" ")
        if @player_board.valid_placement?(@player_submarine, coordinates)
          @player_board.place(@player_submarine, coordinates)
          puts "-" * 50
          puts @player_board.render(true) + "\n"
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
            coordinate = gets.chomp
            print "> "
            if coordinate.fired_upon == false
              if coordinate.valid_coordinate?(coordinate)
                player_shot = @computer_board.cells[coordinate].fire_upon
                computer_shot = @computer.fire #needs to match up with method in computer class
                  #needs to have logic to return different responses (ie. hits, misses, sunk)
                  # if player_shot.render == "H" #needs to have logic to return different responses (ie. hits, misses, sunk)
                  puts "Your shot on #{player_shot} was a #{player_shot.status}." #who knows if this will work
                  puts "My shot on #{computer_shot} was a #{computer_shot.status}" #who knows if this will work
                  break
              else
                puts "Please enter a valid coordinate:"
              end
            else
              puts "You have already fired on this coordinate. Please choose again:"
            end
          end
        end
       if @player_cruiser.sunk? && @player_submarine.sunk?
         puts "You won!"
       elsif @computer_cruiser.sunk? && @computer_submarine.sunk?
         puts "I won!"
       end
    elsif response == "Q"
      puts "You quit! Come back and play later!"
    end
  end
end
