gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_cells_hash_exists
    assert_instance_of Hash, @board.cells
  end

  def test_hash_contains_correct_keys
    assert_equal 16, @board.cells.keys.count
    assert_equal 16, @board.cells.values.count
  end

  def test_hash_values_are_cells
    assert_instance_of Cell, @board.cells.values.first
  end

  def test_valid_coordinate_method
    assert_equal true, @board.valid_coordinate?("B2")
    assert_equal false, @board.valid_coordinate?("D5")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_valid_placement_based_on_length
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["A1", "A2", "A3"])
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "A2", "A3"])
  end

  def test_valid_placement_based_on_consecutive_coordinates
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"]) #consecutive
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"]) #consecutive
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"]) #diagonal
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"]) #diagonal
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"]) #valid
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"]) #valid
    assert_equal false, @board.valid_placement?(@cruiser, ["B1", "C3", "D3"]) #disconnected
    assert_equal false, @board.valid_placement?(@submarine, ["A4", "B1"]) #disconnected
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A3", "A4"]) #hole
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "D10", "A4"]) #outside of board
    assert_equal false, @board.valid_placement?(@submarine, ["A4", "A1"]) #hole
  end

end
