gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/computer_player'

class ComputerTest < Minitest::Test

  def setup
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @computer_board = Board.new
    @computer = Computer.new(@computer_board)
  end

  def test_it_exists
    assert_instance_of Computer, @computer
  end

  def test_it_has_board
    assert_instance_of Board, @computer.computer_board
  end
  #
  # def test_it_has_cruiser
  #   assert_instance_of Ship, @computer.computer_cruiser
  #   assert_equal "Cruiser", @computer.computer_cruiser.name
  # end
  #
  # def test_it_has_submarine
  #   assert_instance_of Ship, @computer.computer_submarine
  #   assert_equal "Submarine", @computer.computer_submarine.name
  # end

  def test_generate_ship_placement
    assert_equal true, @computer_board.valid_placement?(@computer_cruiser, @computer.generate_ship_placement(@computer_cruiser))
  end

  # def test_it_can_fire_on_cell
  #
  #   assert_equal true,
  #test once player_board has been created
  # end
end
