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
    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_cells_hash_exists
    assert_instance_of Hash, @board.cells
  end

  def test_hash_contains_correct_number_of_keys_and_values
    assert_equal 16, @board.cells.keys.count
    assert_equal 16, @board.cells.values.count
  end

  def test_hash_values_are_cell_objects
    assert_instance_of Cell, @board.cells.values.first
  end

  def test_valid_coordinate?
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

  def test_for_consecutive_coordinates
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A3", "A4"])

    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
    assert_equal false, @board.valid_placement?(@submarine, ["A4", "B1"])
  end

  def test_place
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal @cruiser, @cell_1.ship
    assert_equal @cruiser, @cell_2.ship
    assert_equal @cruiser, @cell_3.ship
  end

  def test_ships_dont_overlap
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.ships_dont_overlap(["A1", "B1"])
    assert_equal true, @board.ships_dont_overlap(["B1", "B2"])
  end

  def test_render
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n", @board.render
  end

  def test_render_true
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n", @board.render(true)
  end

end
