gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
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

  def test_valid_coordinate
    assert_equal true, @board.valid_coordinate?("B2")
    assert_equal false, @board.valid_coordinate?("D5")
    assert_equal false, @board.valid_coordinate?("A22")
  end



end
