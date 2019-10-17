require './lib/board'
require './lib/cell'
require './lib/ship'

class Game

  def initialize
    @player_board = Board.new
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
  end

  def main_menu
    puts "-" * 50
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    puts "-" * 50
    response = gets.chomp[0].upcase
    if response == "P"
      computer_setup
    elsif response == "Q"
      puts "-" * 50
      puts "OK! Come back and play again later!"
      puts "-" * 50
    else
      puts "-" * 50
      puts "Invalid response."
      puts "-" * 50
    end
  end

  def computer_setup
    computer_place_ship(@computer_cruiser)
    computer_place_ship(@computer_submarine)
    player_setup_message
    end

  def computer_place_ship(ship)
    coordinates = []
    coordinates = @computer_board.cells.keys.sample(ship.length)
    until @computer_board.valid_placement?(ship, coordinates)
      coordinates = @computer_board.cells.keys.sample(ship.length)
    end
    @computer_board.place(ship, coordinates)
  end

  def player_setup_message
    puts "-" * 50
    puts "WELCOME!"
    puts "-" * 50
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts "-" * 50
    puts @player_board.render(true)
    player_setup
  end

  def player_setup
    player_place_ship(@player_cruiser)
    player_place_ship(@player_submarine)
    setup_complete
  end

  def player_place_ship(ship)
    puts "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
    loop do
    print "> "
    coordinates = gets.chomp.upcase.gsub(",", " ").split(" ")
      if @player_board.valid_placement?(ship, coordinates)
        @player_board.place(ship, coordinates)
        puts "-" * 50
        puts "Your #{ship.name} has been placed!\n"
        puts "-" * 50
        puts @player_board.render(true)
        break
      else
        puts "-" * 50
        puts "Those are invalid coordinates. Please try again:"
        puts "-" * 50
      end
    end
  end

  def setup_complete
    puts "-" * 50
    puts "Setup complete! Ready to play!"
    puts "-" * 50
    take_turn
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
    print "> "
    @player_shot = gets.chomp.upcase
      if @computer_board.valid_coordinate?(@player_shot) && !@computer_board.cells[@player_shot].fired_upon?
        @computer_board.cells[@player_shot].fire_upon
        break
      elsif !@computer_board.valid_coordinate?(@player_shot)
        puts "-" * 50
        puts "Please enter a valid coordinate:"
      else
        puts "-" * 50
        puts "You have already fired on this coordinate. Please choose again:"
      end
    end
  end

  def computer_fires
    @computer_shot = @player_board.cells.keys.sample
    if !@player_board.cells[@computer_shot].fired_upon
      @player_board.cells[@computer_shot].fire_upon
    end
  end

  def display_player_results
    if @computer_board.cells[@player_shot].render == "H"
      puts "-" * 50
      puts "Your shot on #{@player_shot} was a hit!"
    elsif @computer_board.cells[@player_shot].render == "M"
      puts "-" * 50
      puts "Your shot on #{@player_shot} was a miss!"
    elsif @computer_board.cells[@player_shot].render == "X"
      puts "-" * 50
      puts "Your shot on #{@player_shot} sunk my ship!"
    end
  end

  def display_computer_results
    if @player_board.cells[@computer_shot].render == "H"
      puts "My shot on #{@computer_shot} was a hit!"
      puts "-" * 50
    elsif @player_board.cells[@computer_shot].render == "M"
      puts "My shot on #{@computer_shot} was a miss!"
      puts "-" * 50
    elsif @player_board.cells[@computer_shot].render == "X"
      puts "My shot on #{@computer_shot} sunk your ship!"
      puts "-" * 50
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
