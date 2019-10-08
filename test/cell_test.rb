gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'


class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_coordinate_exists
    assert_equal "B4", @cell.coordinate
  end

  def test_can_ship_be_in_cell
    assert_equal
  end

  def test_is_ship_in_cell
  end

  def test_cell_empty?
    assert_equal true, @cell.empty?
  end


end
