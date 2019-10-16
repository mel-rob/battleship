require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

class Game

  def initialize
    @player_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
  end

  def start
    main_menu
  end

  def main_menu
    puts "-" * 50
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    puts "-" * 50
    response = gets.chomp[0].upcase
    if response == "P"
      board_setup
    elsif response == "Q"
      puts "You quit! Come back and play again later!"
    end
  end

  def board_setup
    computer_place_ships
    setup_message
    player_place_ships
  end

  def place_ship(ship)
    coordinates = []
    until @computer_board.valid_placement?(ship, coordinates) == true
      coordinates = @computer_board.cells.keys.sample(ship.length)
    end
    @computer_board.place(ship, coordinates)
  end


  def computer_place_ships
    place_ship(@computer_cruiser)
    place_ship(@computer_submarine)
  end

  def setup_message
    puts "-" * 50
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "-" * 50
    puts @player_board.render(true)
    player_place_ships
  end

  def player_place_ships
    cruiser_setup
    submarine_setup
  end

  def cruiser_setup
    puts "Enter the squares for the Cruiser (3 spaces):"
    print "> "
    coordinates = gets.chomp.upcase.gsub(",", " ").split(" ")
    if @player_board.valid_placement?(@player_cruiser, coordinates)
      @player_board.place(@player_cruiser, coordinates)
      puts "-" * 50
      puts "Your cruiser has been placed!\n"
      puts "-" * 50
      puts @player_board.render(true) + "\n"
      submarine_setup
    else
      puts "-" * 50
      puts "Those are invalid coordinates. Please try again:"
      puts "-" * 50
      cruiser_setup
    end
  end

  def submarine_setup
    puts "Enter the squares for the Submarine (2 spaces):"
    print "> "
    coordinates = gets.chomp.upcase.gsub(",", " ").split(" ")
    if @player_board.valid_placement?(@player_submarine, coordinates)
      @player_board.place(@player_submarine, coordinates)
      puts "-" * 50
      puts "Your submarine has been placed!"
      puts "-" * 50
      puts @player_board.render(true) + "\n"
      puts "-" * 50
      puts "Ready to play!"
      puts "-" * 50
      take_turn
    else
      puts "-" * 50
      puts "Those are invalid coordinates. Please try again:"
      puts "-" * 50
      submarine_setup
    end
  end

  def take_turn
    until @player_cruiser.sunk? && @player_submarine.sunk? || @computer_cruiser.sunk? && @computer_submarine.sunk? do
      display_boards
      player_fires
      computer_fires
      display_player_results
      display_computer_results
    end
    game_over
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render(false)
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)
  end

  def player_fires
    puts "Enter the coordinate for your shot:"
    loop do
    @player_shot = gets.chomp.upcase
    print "> "
      if @computer_board.valid_coordinate?(@player_shot) && @computer_board.cells[@player_shot].fired_upon == false
        @computer_board.cells[@player_shot].fire_upon
        break
      elsif !@computer_board.valid_coordinate?(@player_shot)
        puts "Please enter a valid coordinate:"
      else
        puts "You have already fired on this coordinate. Please choose again:"
      end
    end
  end

  def computer_fires
    @computer_shot = @player_board.cells.keys.sample
    if @player_board.cells[@computer_shot].fired_upon == false
      @player_board.cells[@computer_shot].fire_upon
    end
  end

  def display_player_results
    if @computer_board.cells[@player_shot].render == "H"
      puts "Your shot on #{@player_shot} was a hit!"
    elsif @computer_board.cells[@player_shot].render == "M"
      puts "Your shot on #{@player_shot} was a miss!"
    elsif @computer_board.cells[@player_shot].render == "X"
      puts "Your shot on #{@player_shot} sunk  my ship!"
    end
  end

  def display_computer_results
    if @player_board.cells[@computer_shot].render == "H"
      puts "My shot on #{@computer_shot} was a hit!"
    elsif @player_board.cells[@computer_shot].render == "M"
      puts "My shot on #{@computer_shot} was a miss!"
    elsif @player_board.cells[@computer_shot].render == "X"
      puts "My shot on #{@computer_shot} sunk  your ship!"
    end
  end

  def game_over
    if @player_cruiser.sunk? && @player_submarine.sunk?
      puts "I won!"
    elsif @computer_cruiser.sunk? && @computer_submarine.sunk?
      puts "You won!"
    end
    initialize
    main_menu
  end
end
